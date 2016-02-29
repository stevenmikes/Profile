procedure(showLabels()
    foreach(inst geGetEditCellView()~>instances
        CCSselectAllInstLabels(inst)~>isVisible=t
    ) 
)
