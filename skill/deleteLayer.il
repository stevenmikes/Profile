procedure( deleteLayer()
    cv = geGetEditCellView();
    lppList = strcat(cv~>lpps~>layerName, cv~>lpps~>purpose)
    hiShowListBox(
        ?name 'layerSelectBox
        ?choices lppList
        ?title "Select LPP to delete"
        ?callback 'layerSelectBoxCB
    ); end hiShowListBox

    ;del_lpp = car(exists(lp cv~>lpps and(lp~>layerName=="poly" lp~>purpose=="drawing")))


    procedure( layerSelectBoxCB(okPressed listbox "go")
;        foreach( shape del_lpp~>shapes
;          dbDeleteObject(shape)
;        )
        info("wahaha")
    ); end procedure
); end procedure
