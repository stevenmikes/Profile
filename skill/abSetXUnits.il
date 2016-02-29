/* abSetXUnits.il

Author     A.D.Beckett
Group      Custom IC (UK), Cadence Design Systems Ltd.
Language   SKILL
Date       Jul 13, 2012 
Modified   
By         

abSetXUnits(waveform "s")

sets the units on the X axis a waveform to be seconds.

abRegSetXUnitsSpecialFunction()

registers a function in the calculator to alter the units on a 
waveform.

This is based on abSetUnits, but does it for the X axis.

***************************************************

SCCS Info: @(#) abSetXUnits.il 07/13/12.17:53:47 1.1

*/

/****************************************************************
*                                                               *
*                   (abSetXUnits wave units)                    *
*                                                               *
* Sets the units on a waveform, or all the members of a family. *
* If it is just a value, pass straight through (can't set units *
*                         on a number).                         *
*                                                               *
****************************************************************/

(defun abSetXUnits (wave units)
  (cond 
      ((drIsWaveform wave)
           (putpropq (drGetWaveformXVec wave) units units)
                wave
                     )
          ((famIsFamily wave)
               (famMap 'abSetXUnits wave units)
                    )
              )
    )

/***************************************************************
*                                                              *
*                   (abCreateSetXUnitsForm)                    *
*                                                              *
*  Set up a form for the special function on the calculator,   *
*  which gives choices for the units. It needs to be cyclic,   *
*   because if it's a type in field, quotes don't get added    *
*                      around the units.                       *
*                                                              *
***************************************************************/

(defun abCreateSetXUnitsForm ()
  (let (units)
      (setq units (ahiCreateCyclicField
              ?name 'units
                      ?prompt "Units"
                              ?choices '("V" "A" "s" "W" "dB" "Wb" "C" "Hz")
                                      ?value "s"
                                              ))
          (calCreateSpecialFunctionsForm
                'abSetXUnitsForm
                      (list 
                        (list units 0:0  180:20 140)
                            )
                            )
              ))

/*****************************************************************
*                                                                *
*                (abSetXUnitsSpecialFunctionCB)                  *
*                                                                *
*       Callback for the abSetXUnits special function, which     *
*       constructs the buffer input from the form and stack.     *
*                                                                *
*****************************************************************/

(defun abSetXUnitsSpecialFunctionCB ()
  (calCreateSpecialFunction
     ?formSym 'abSetXUnitsForm
        ?formInitProc 'abCreateSetXUnitsForm
           ?formTitle "Set Units"
              ?formCallback 
                 "(calSpecialFunctionInput 'abSetXUnits '(units))"
                    ))


/***************************************************************
*                                                              *
*               (abRegSetXUnitsSpecialFunction)                *
*                                                              *
*                Register the special function                 *
*                                                              *
***************************************************************/

(defun abRegSetXUnitsSpecialFunction ()
  (calRegisterSpecialFunction
     (list "abSetXUnits..." 'abSetXUnitsSpecialFunctionCB))
    t
      )
