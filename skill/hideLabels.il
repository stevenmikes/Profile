procedure(hideLabels()
    foreach(inst
      geGetEditCellView()~>instances
      CCSselectAllInstLabels(inst)~>isVisible=nil
    ) 
)
