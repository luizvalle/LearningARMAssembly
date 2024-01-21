.global distance
distance:
    push {r4-r12, lr}
    vpush {s16-s31}

    vldm r0, {s0-s3} // Load 4 32-bit  numbers from addresses beginning at that contained in r0
    vsub.f32 s4, s0, s2 // x1 - x2
    vsub.f32 s5, s1, s3 // y1 - y2
    vmul.f32 s4, s4 // (x1 - x2)^2
    vmul.f32 s5, s5 // (y1 - y2)^2
    vadd.f32 s4, s5 // (x1 - x2)^2 + (y1 - y2)^2
    vsqrt.f32 s4, s4 // sqrt((x1 - x2)^2 + (y1 - y2)^2)
    vmov r0, s4 // Move it back to the CPU register to return
 
    vpop {s16-s31}
    pop {r4-r12, lr}
    bx lr
