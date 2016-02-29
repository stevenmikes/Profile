procedure( limit(num lo hi)
let( (retval)
    cond(
    (num<lo retval=lo)
    (num>=lo && num<=hi retval=num)
    (num>hi retval=hi)
    )
)
)
