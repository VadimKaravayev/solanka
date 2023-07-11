class Optional {
    constructor(value) {
        this.value = value;
    }

    empty() {
        return new Optional(null);
    }

    of(value) {
        if (!value) {
            throw new Error();
        }
        return new Optional(value);
    }

    ofNullable(value) {
        return value ? new Optional(value) : this.empty();
    }

    get() {
        if (!this.value) {
            throw new Error("No value");
        }
        return this.value;
    }

    isPresent() {
        return !!this.value;
    }

    isEmpty() {
        return !this.value;
    }

    ifPresent(fn) {
        if (this.value) {
            fn(this.value);
        }
    }

    ifPresentOrElse(action, emptyAction) {
        if (this.value) {
            action(this.value);
        } else {
            emptyAction();
        }
    }

    filter(predicate) {
        if (this.isEmpty()) {
            return this;
        } else {
            return predicate(this.value) ? this : this.empty();
        }
    }

    map(mapper) {
        return this.isEmpty()
            ? this.empty()
            : this.ofNullable(mapper(this.value));
    }
}