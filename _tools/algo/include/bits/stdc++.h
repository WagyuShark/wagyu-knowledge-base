// Stand-in for libstdc++'s <bits/stdc++.h>, which Apple clang/libc++ does not ship.
// Lets `#include <bits/stdc++.h>` compile locally exactly as it does on GCC-based judges.
#pragma once

// C
#include <cassert>
#include <cctype>
#include <cerrno>
#include <cfloat>
#include <climits>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>

// Containers
#include <array>
#include <bitset>
#include <deque>
#include <forward_list>
#include <list>
#include <map>
#include <queue>
#include <set>
#include <span>
#include <stack>
#include <unordered_map>
#include <unordered_set>
#include <vector>

// Utilities & algorithms
#include <algorithm>
#include <any>
#include <bit>
#include <chrono>
#include <complex>
#include <functional>
#include <initializer_list>
#include <iterator>
#include <limits>
#include <memory>
#include <numbers>
#include <numeric>
#include <optional>
#include <random>
#include <ranges>
#include <ratio>
#include <tuple>
#include <type_traits>
#include <utility>
#include <valarray>
#include <variant>

// Strings & I/O
#include <fstream>
#include <iomanip>
#include <iostream>
#include <istream>
#include <ostream>
#include <sstream>
#include <string>
#include <string_view>
