
#include "eventpp/callbacklist.h"
#include <iostream>

int main(int argc, char* argv[])
{
	eventpp::CallbackList<void(const std::string&)> callbacks;
	callbacks.append([](const std::string& arg)
		{
			std::cout << "hello " << arg << std::endl;
		});

	callbacks("world!");
	return 0;
}