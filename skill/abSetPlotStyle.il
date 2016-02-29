/* abSetPlotStyle.il

Language   SKILL
Date       Dec 10, 2009 

abSetPlotStyle(waveform "joined")

Sets a waveform to be plotted as joined. Can also be set to "bar" or
"scatterPlot" or "auto".

abRegSetPlotStyleSpecialFunction()

registers a function in the calculator to alter the plot style on a 
waveform.

***************************************************

SCCS Info: @(#) abSetPlotStyle.il 03/12/12.12:57:51 1.3

*/

/*******************************************************************************
*  DISCLAIMER: The following code is provided for Cadence customers to use at  *
*   their own risk. The code may require modification to satisfy the           *
*   requirements of any user. The code and any modifications to the code may   *
*   not be compatible with current or future versions of Cadence products.     *
*   THE CODE IS PROVIDED "AS IS" AND WITH NO WARRANTIES, INCLUDING WITHOUT     *
*   LIMITATION ANY EXPRESS WARRANTIES OR IMPLIED WARRANTIES OF MERCHANTABILITY *
*   OR FITNESS FOR A PARTICULAR USE.                                           *
*******************************************************************************/


/***************************************************************
*                                                              *
*               (abSetPlotStyle wave plotStyle)                *
*                                                              *
*   Set the plotStyle to one of "auto", "scatterPlot", "bar"   *
*     or "joined" (same as ocnHelp('plotStyle) choices) on     *
*                   the waveform passed in.                    *
*                                                              *
***************************************************************/

(defun abSetPlotStyle (wave plotStyle "gS")
  (setq plotStyle (concat plotStyle))
    (cond 
        ((drIsWaveform wave)
             (if (eq plotStyle 'auto)
                    (remprop wave 'plotStyle)
                           (putpropq wave plotStyle plotStyle)
                                  )
                  wave
                       )
            ((famIsFamily wave)
                 (famMap 'abSetPlotStyle wave plotStyle)
                      )
                )
      )

/***************************************************************
*                                                              *
*                  (abCreateSetPlotStyleForm)                  *
*                                                              *
*  Set up a form for the special function on the calculator,   *
* which gives choices for the plotStyle. It needs to be cyclic,*
*   because if it's a type in field, quotes don't get added    *
*                      around the units.                       *
*                                                              *
***************************************************************/

(defun abCreateSetPlotStyleForm ()
  (let (plotStyle)
      (setq plotStyle (ahiCreateCyclicField
              ?name 'plotStyle
                      ?prompt "PlotStyle"
                              ?choices '("auto" "scatterPlot" "bar" "joined")
                                      ?value "auto"
                                              ))
          (calCreateSpecialFunctionsForm
                'abSetPlotStyleForm
                      (list 
                        (list plotStyle 0:0  180:20 140)
                            )
                            )
              ))

/*****************************************************************
*                                                                *
*               (abSetPlotStyleSpecialFunctionCB)                *
*                                                                *
*    Callback for the abSetPlotStyle special function, which     *
*     constructs the buffer input from the form and stack.       *
*                                                                *
*****************************************************************/

(defun abSetPlotStyleSpecialFunctionCB ()
  (calCreateSpecialFunction
     ?formSym 'abSetPlotStyleForm
        ?formInitProc 'abCreateSetPlotStyleForm
           ?formTitle "Set PlotStyle"
              ?formCallback 
                 "(calSpecialFunctionInput 'abSetPlotStyle '(plotStyle))"
                    ))


/***************************************************************
*                                                              *
*              (abRegSetPlotStyleSpecialFunction)              *
*                                                              *
*                Register the special function                 *
*                                                              *
***************************************************************/

(defun abRegSetPlotStyleSpecialFunction ()
  (calRegisterSpecialFunction
     (list "abSetPlotStyle..." 'abSetPlotStyleSpecialFunctionCB))
    t
      )
