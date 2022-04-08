#include "Core/Define.h"
#include "Core/Allocator.h"

class A
{
public:
    int a;
    int b;
};

int main()
{
    void* a = Allocator::alloc(sizeof(A));
    return 0;
}
