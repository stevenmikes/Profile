procedure( findBestIMD(IMDfam PAEfam)
    outFile=outfile("./o.out")
    findBestIMDrec(IMDfam PAEfam outFile)
    drain(outFile)
    close(outFile)
)

procedure( findBestIMDrec(IMDfam PAEfam outFile @optional (printHeader t) @rest args)
let((xminVal sweepVal IMDsubFam PAEsubFam depth varName)
    ;print column headers
    when(printHeader
        depth=0
        varName=""
        while(varName=famGetSweepName(IMDfam depth)
            printf("%-15s" varName )
            fprintf(outFile "%-15s" varName )
            depth=depth+1
        );while
        printf("%-15s%-15s\n" "IMD" "PAE")
        fprintf(outFile "%-15s%-15s\n" "IMD" "PAE")
    );when
    
    foreach(sweepVal famGetSweepValues(IMDfam)
        IMDsubFam=famValue(IMDfam sweepVal)
        PAEsubFam=famValue(PAEfam sweepVal)
        if( famIsFamily(IMDsubFam) then
            findBestIMDrec(IMDsubFam PAEsubFam outFile nil cons(sweepVal args))
        else
            foreach( arg args
                printf("%-15g" car(arg))
                fprintf(outFile "%-15g" car(arg))
            );foreach
            xminVal=xmin(IMDsubFam)
            printf("%-15g%-15g%-15g%-15g\n"
                   sweepVal xminVal ymin(IMDsubFam) value(PAEsubFam xminVal) )
            fprintf(outFile "%-15g%-15g%-15g%-15g\n"
                   sweepVal xminVal ymin(IMDsubFam) value(PAEsubFam xminVal) )
        );if
    );foreach
);let
);procedure
