#include <bits/stdc++.h>

using namespace std;

int gcd(int a, int b)
{
    return a % b == 0 ? b : gcd(b, a % b);
}

int main()
{
    int a, b;
    cin >> a >> b;
    cout << gcd(a, b);
    return 0;
}