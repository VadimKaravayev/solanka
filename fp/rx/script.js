const { fromEvent, scan, Observable } = rxjs;

fromEvent(document, "click")
  .pipe(scan((count) => count + 1, 0))
  .subscribe((count) => console.log(`Clicked ${count} times`));

const observable = new Observable((subscriber) => {
  subscriber.next(1);
  subscriber.next(2);
  subscriber.next(3);
  setTimeout(() => {
    subscriber.next(4);
  }, 2000);
});

observable.subscribe({
  next(val) {
    console.log("next(): ", val);
  },
  error(err) {
    console.log("Error", err);
  },
  complete() {
    console.log("Completed");
  },
});
