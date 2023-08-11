import hh from "hyperscript-helpers";
import { cond, equals, T, inc, dec, always } from "ramda";
import { h, diff, patch } from "virtual-dom";
import createElement from "virtual-dom/create-element";

const { div, button } = hh(h);

const initModel = 0;

const MSGS = {
  ADD: "ADD",
  SUBTRACT: "SUBTRACT",
};

function update(msg, model) {
  return cond([
    [equals(MSGS.ADD), always(inc(model))],
    [equals(MSGS.SUBTRACT), always(dec(model))],
    [T, always(model)],
  ])(msg);
}

function view(dispatch, model) {
  return div([
    div({ className: "mv2" }, `Count: ${model}`),
    button(
      { className: "pv1 ph2 mr2", onclick: () => dispatch(MSGS.ADD) },
      "+"
    ),
    button(
      { className: "pv1 ph2 mr2", onclick: () => dispatch(MSGS.SUBTRACT) },
      "-"
    ),
  ]);
}

function app(initModel, update, view, node) {
  let model = initModel;
  let currentView = view(dispatch, model);
  let rootNode = createElement(currentView);
  node.append(rootNode);
  
  function dispatch(msg) {
    model = update(msg, model);
    const updatedView = view(dispatch, model);
    const patches = diff(currentView, updatedView);
    rootNode = patch(rootNode, patches);
    currentView = updatedView;
  }
}

const rootNode = document.querySelector("#app");

app(initModel, update, view, rootNode);
