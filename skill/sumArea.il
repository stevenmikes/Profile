procedure( instArea(inst)
  let((w1 l1 m1 f1 wfet lfet AREA)
    cond(
      (rexMatchp("^pch",inst~>cellName)
        w1 = cdfParseFloatString(inst~>w)
        l1 = cdfParseFloatString(inst~>l)
        m1 = cdfParseFloatString(inst~>m)
        f1 = cdfParseFloatString(inst~>fingers)

        wfet = w1 + 1.4u
        lfet = f1*l1 + (f1-1)*0.36u + 2u
        AREA = m1*wfet*lfet
        )
      (rexMatchp("^nch",inst~>cellName)
        w1 = cdfParseFloatString(inst~>w)
        l1 = cdfParseFloatString(inst~>l)
        m1 = cdfParseFloatString(inst~>m)
        f1 = cdfParseFloatString(inst~>fingers)

        wfet = w1 + 0.6u
        lfet = f1*l1 + (f1-1)*0.36u + 1.2u
        AREA = m1*wfet*lfet
        )
      (t
        warn("Unrecognized device %L\n" inst~>cellName)
        AREA = 0.0
        )
    ) ; cond
    AREA
  ) ; let
) ; procedure instArea

procedure( sumArea(@optional (cv geGetEditCellView()) (topLevel t))
    let((master instArea (area 0.0))
    foreach(inst cv~>instances
        cond(
          (inst~>libName == "tsmcN45"
            area=area+instArea(inst)
            )
          (inst~>libName == "analogLib"
              nil
            )
          (inst~>libName == "basic"
              nil
            )
          (t
            when(inst~>purpose == "cell"
                master = dbOpenCellViewByType(inst~>libName inst~>cellName "schematic")
                when(master
                    instArea=sumArea(master nil)
                    when(topLevel
                    printf("Instance %s of %s has area %g\n" inst~>name
                    inst~>cellName instArea)
                    ) ; when topLevel
                    area=area+instArea
                ) ; when master
            ) ; when purpose is cell
            )
        ) ; cond
    ) ; foreach
    area
    )
) ; procedure sumArea

totalArea=sumArea()
printf("Total area is %g\n" totalArea)
