// Bubble sort.
// Input:  n, then n integers.
// Output: the integers in ascending order, space-separated.
#include <bits/stdc++.h>
using namespace std;

void bubble_sort(vector<int>& a) {
    int n = (int)a.size();
    for (int pass = 0; pass < n - 1; pass++) {
        bool swapped = false;
        // After each pass the largest remaining value has bubbled to the end.
        for (int i = 0; i < n - 1 - pass; i++) {
            if (a[i] > a[i + 1]) {
                swap(a[i], a[i + 1]);
                swapped = true;
            }
        }
        if (!swapped) break;  // already sorted
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int n;
    cin >> n;
    vector<int> a(n);
    for (int& x : a) cin >> x;

    bubble_sort(a);

    for (int i = 0; i < n; i++) {
        cout << a[i] << (i + 1 < n ? ' ' : '\n');
    }
}
