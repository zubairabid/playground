# Assume t is a trivial type and write a GCD program

#include <iostream>
#include <type_traits>
#include <limits>
#include <chrono>

template <typename T>
T gcd(T a, T b) {
  static_assert(std::is_integral<T>(), "gcd algorithm works on integral types only");
  if(a == 0 || b == 0)
    return (a == 0) ? b : a;
  return (a < b) ? gcd(a, b - a) : gcd(a - b, b);
}

namespace boost {
  template <typename T>
  class vector {
  public:
    typedef T value_type;
    typedef std::size_t size_type;

    vector() { }
    vector(vector &&vec) { }
    vector(const vector &vec) { }
    vector(std::size_t count) { }

    size_type size() { return _last - _first; }

    vector &operator=(vector &a) { }
    vector &operator=(vector &&a) { }
  private:
    T* _first;
    T* _last;
  };
}

a = b;
a = std::move(b);

int main () {

  return 0;

}
