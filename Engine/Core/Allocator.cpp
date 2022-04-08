#include "Allocator.h"

Zu8 Allocator::m_mem[32000];
Zu16 Allocator::m_offset = 0;

void* Allocator::alloc(Zsize s)
{
    m_offset += s;
    return m_mem + m_offset;
}

void Allocator::free(void* mem)
{
    
}
