      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       CONFIGURATION SECTION.
      *-----------------------
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FILE-1 ASSIGN TO 'input1.txt'
           ORGANIZATION IS LINE SEQUENTIAL.

           SELECT FILE-2 ASSIGN TO 'input2.txt'
           ORGANIZATION IS LINE SEQUENTIAL.

           SELECT MERGE-FILE ASSIGN TO 'test.txt'.
       *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.

           FD FILE-1.

           01 RECORD-1.
              03 IN-NAME-1 PIC X(20).
              03 FILLER PIC X(50).

           FD FILE-2.

           01 RECORD-2.
              03 IN-NAME-2 PIC X(20).
              03 FILLER PIC X(50).

           FD MERGE-FILE.
           01 RECORD-OUT PIC X(70).

      *-----------------------
       WORKING-STORAGE SECTION.
       01 EOF-FLAG-1 PIC X VALUE 'N'.
       01 EOF-FLAG-2 PIC X VALUE 'N'.
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
           OPEN INPUT FILE-1.
           OPEN INPUT FILE-2.

           OPEN OUTPUT MERGE-FILE.

           PERFORM UNTIL EOF-FLAG-1 = 'Y' AND EOF-FLAG-2 ='Y'
      *loop until each file has been read to completion
      *read each file



             READ FILE-1
               AT END SET EOF-FLAG-1 TO 'Y'
               MOVE HIGH-VALUES TO IN-NAME-1
             END-READ
             READ FILE-2
               AT END SET EOF-FLAG-2 TO 'Y'
               MOVE HIGH-VALUES TO IN-NAME-2
             END-READ
      *sort the records (assuming no 2 names are the same)
      *on ascending surname
             IF IN-NAME-1 IS < IN-NAME-2 THEN
               WRITE RECORD-OUT FROM RECORD-1
             ELSE
               WRITE RECORD-OUT FROM RECORD-2
             END-IF
           END-PERFORM

           CLOSE FILE-1.
           CLOSE FILE-2.
           CLOSE MERGE-FILE.
           STOP RUN.

       END PROGRAM YOUR-PROGRAM-NAME.
