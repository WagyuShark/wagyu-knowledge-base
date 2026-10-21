// Bubble sort.
// Input:  n, then n integers.
// Output: the integers in ascending order, space-separated.
use std::io::{self, Read, Write};

fn bubble_sort(a: &mut [i32]) {
    let n = a.len();
    for pass in 0..n.saturating_sub(1) {
        let mut swapped = false;
        // After each pass the largest remaining value has bubbled to the end.
        for i in 0..n - 1 - pass {
            if a[i] > a[i + 1] {
                a.swap(i, i + 1);
                swapped = true;
            }
        }
        if !swapped {
            break; // already sorted
        }
    }
}

fn main() {
    let mut input = String::new();
    io::stdin().read_to_string(&mut input).unwrap();
    let mut tokens = input.split_ascii_whitespace();

    let n: usize = tokens.next().unwrap().parse().unwrap();
    let mut a: Vec<i32> = (0..n)
        .map(|_| tokens.next().unwrap().parse().unwrap())
        .collect();

    bubble_sort(&mut a);

    let out = io::stdout();
    let mut out = io::BufWriter::new(out.lock());
    let line: Vec<String> = a.iter().map(|x| x.to_string()).collect();
    writeln!(out, "{}", line.join(" ")).unwrap();
}
