use std::io;

fn main() {
    let mut x = 5;
    println!("Value is {x}");

    x = 10;
    println!("Now value is {x}");

    const THREE_HOURS_IN_SECONDS: u32 = 3 * 60 * 60;

    println!("Three hours in seconds {THREE_HOURS_IN_SECONDS}");

    //Data types. Scalar and compound

    let number: u32 = "42".parse().expect("Not a number");

    println!("{number}");

    let price_1 = 3.4;
    let price_2: f32 = 8.4;

    println!("{price_1}");

    let product: (String, f64, bool, char) = ("Ice cream".parse().unwrap(), 4.5, true, 'A');
    println!("{}", product.0);
    println!("{}", product.1);
    println!("{}", product.2);
    println!("{}", product.3);

    //destructuring
    let (name, price, in_store, category) = product;

    println!("name: {name}");
    println!("price: {price}");
    println!("in store: {in_store}");
    println!("category: {category}");

    //Arrays. Fixed size, same data type

    let ints = [1,2,3,4,5];
    let winter_months = ["December", "January", "February"];
    let winter_second_month = winter_months[1];

    println!("Winter second month is {winter_second_month}");

    fn sum(a: f32, b: f32) -> f32 {
        return a + b;
    }

    let res = sum(4.0, 5.0);

    if res < 10.0 {
        println!("Res: {res}")
    } else {
        println!("too big");
    }

    //ternary
    let foo = if true {"bar"} else {"baz"};
    println!("{}", foo);

    for i in [1,2,3,4,5] {
        println!("{}", i);
    }
}
