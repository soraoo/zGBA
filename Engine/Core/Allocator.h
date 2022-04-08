#ifndef ZGBA_ENGINE_CORE_ALLOCATOR_H
#define ZGBA_ENGINE_CORE_ALLOCATOR_H

#include "Define.h"

class Allocator
{
public:
    static void* alloc(Zu32 size);
    static void free(void* mem);

private:
    static Zu8 m_mem[32000];
    static Zu16 m_offset;
};

#endif // ZGBA_ENGINE_CORE_ALLOCATOR_H
