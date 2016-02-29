/* abWaveToList.il

Author     A.D.Beckett
Group      Custom IC (UK), Cadence Design Systems Ltd.
Language   SKILL
Date       Nov 17, 2003
Modified
By

Convert a waveform to a list

***************************************************

SCCS Info: @(#) abWaveToList.il 11/17/03.15:08:15 1.1

*/

/************************************************************************
*                                                                       *
*                  (abWaveToList wave @key transpose)                   *
*                                                                       *
*    Take a waveform object, and return it as a list of xy pairs. Or    *
* if transpose is set, it returns a list of x values followed by a list *
*                             of y values.                              *
*                                                                       *
************************************************************************/


(procedure (abWaveToList wave @key transpose)
    (let (xList yList xyList len
        (xVec (drGetWaveformXVec wave))
        (yVec (drGetWaveformYVec wave))
        )
        (setq len (drVectorLength xVec))
        ;-----------------------------------------------------------------
        ; Return value of this if is the list
        ;-----------------------------------------------------------------
        (if transpose
            (progn
            (for i 0 (sub1 len)
            (setq xList (tconc xList (drGetElem xVec i)))
            (setq yList (tconc yList (drGetElem yVec i)))
            )
            (list (car xList) (car yList))
            )
            ; else
            (progn
            (for i 0 (sub1 len)
            (setq xyList (tconc xyList (list (drGetElem xVec i)
            (drGetElem yVec i))))
            )
            (car xyList)
            )
        ) ; if
    ) ; let
) ; procedure
