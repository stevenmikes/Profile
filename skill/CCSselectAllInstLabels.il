/* CCSselectAllInstLabels.il
 
Group           Custom IC, Cadence Design Systems
Language        SKILL
Revision No.    1.1
Date Created    Mar 12, 2004
Last Modified
Tested in       IC50
Lint score      100 (best is 100)
Description:
 
A function to select the textDisplays for an instances' labels.
If the label did not already have a textDisplay then a new one is
created. This only works for labels that were "cdsParam" labels in
the instance.
 
The function either takes a dbobject which represents an instance,
or the first selected object of the selected set, if it is an
instance. It is deselected, and then all the textDisplays are
found or created and then selected. The list of selected objects is
returned.
 
Usage:
 
  ;; assuming an instance is selected
  CCSselectAllInstLabels()
  => nil / l_selectedObjects
 
  ;; find the instance named "NM0"
  instDbObj = dbFindAnyInstByName(geGetEditCellView() "NM0")
  ;; select all of its textDisplays if any
  CCSselectAllInstLabels(instDbObj)
  => (db:79087460 db:79087556 db:79087652 db:79087748 db:79087844)
 
***************************************************
 
SCCS Info: @(#) CCSselectAllInstLabels.il 03/12/04.16:57:43 1.1
 
********************************************************************
* DISCLAIMER: The following code is provided for Cadence customers *
* to use at their own risk. The code may require modification to   *
* satisfy the requirements of any user. The code and any           *
* modifications to the code may not be compatible with current or  *
* future versions of Cadence products.                             *
* THE CODE IS PROVIDED "AS IS" AND WITH NO WARRANTIES, INCLUDING   *
* WITHOUT LIMITATION ANY EXPRESS WARRANTIES OR IMPLIED WARRANTIES  *
* OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR USE.              *
********************************************************************
 
*/
 
/******************************************************************
*                                                                 *
*               CCSselectAllInstLabels( [ d_obj ] )               *
*                                                                 *
* An instance db object it passed in, or the car of the selected  *
*  set of objects is used.  It is deselected and then all of the  *
* textDisplays for the instance that were for the cdsParam labels *
* are either created or obtained if they already existed. Each of *
*  these objects is selected and the list of selected objects is  *
*                   returned, or nil otherwise.                   *
*                                                                 *
******************************************************************/
 
procedure(CCSselectAllInstLabels(@optional obj "g")
  when(dbobjectp(or(obj obj = car(geGetSelectedSet())))
    when(obj~>objType=="inst"
      ;; deselect the instance
      geDeselectFigNoFilter(obj)
      ;; use setof to both return a list of selected objects,
      ;; and to actually select them - since geSelectFigNoFilter
      ;; can only select one object at a time, not a list of
      ;; objects, which is what we get from the foreach mapcar
      setof(textDisplayLabel
        ;; iterate over the labels for the instance that are
        ;; specified as "cdsParam" labels in the symbol view,
        ;; get or create a textDisplay object for the label and
        ;; return all of these in a single list
        foreach(mapcar label setof(x obj~>master~>shapes
                        and(x~>objType=="label"
                            rexMatchp("cdsParam" x~>theLabel) ||
                            ;rexMatchp("cdsTerm"  x~>theLabel)
                            nil
                            ))
          ;; if this object already has a textDisplay for this label
          ;; return it, else create a new one
          if(dbGetAssociateTextDisplay(label obj)
            dbGetAssociateTextDisplay(label obj)
            dbCreateTextDisplay(
              label             ;; child to become textDisplay
              obj                       ;; parent
              label~>lpp                ;; layer purpose pair
              list("justify" "orient") ;; display characteristics to override
              list(0 0)         ;; origin of textDisplay
              label~>justify    ;; justification, copy from child
              label~>orient     ;; orientation, copy from child
              label~>font               ;; font, copy from child
              label~>height     ;; font height, copy from child
            ); dbCreateTextDisplay
          ); if textDisplay already exists
        ); foreach mapcar
        geSelectFigNoFilter(textDisplayLabel)
      ); setof
    ); when object is an instance
  ); when there is an object passed in
); procedure CCSselectAllInstanceLabels
