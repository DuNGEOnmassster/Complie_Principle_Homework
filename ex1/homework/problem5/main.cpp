// main.cpp
#include <iostream>
#include "person.hpp"

int main(int argc, char **argv) {
	person::Person p{"Norman Zheng"};
	std::cout << p.sayHello() << '\n';
	return 0;
};