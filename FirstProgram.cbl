      ******************************************************************
      * Author: Jan Ramón Blöcher
      * Date: 29/01/2024
      * Purpose: learning
      * Tectonics: cobc
      * everything in this file is going to follow the tutorial from this website: https://www.academictutorials.com/cobol/
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
      * information about program name(PROGRAM-ID) (non-optional), author(AUTHOR), supplies or other information (optional)
      * use of full stops is important
      * details in area B
      * date compiled is written automatically by compiler
       PROGRAM-ID. HELLO-WORLD-PROG.
       ENVIRONMENT DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
      * tells the computer what the program will be interacting with (printers, disk drives, other files ...)
       CONFIGURATION SECTION.
      *-----------------------
      * defines source and object computer
       SOURCE-COMPUTER. DESKTOP-9VGD201.
           OBJECT-COMPUTER. DESKTOP-9VGD201.
       INPUT-OUTPUT SECTION.
      *-----------------------
      * printers, files that may be used and assigns identifier names to external features
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO 'input.dat'
           ORGANIZATION IS LINE SEQUENTIAL.
           SELECT PRINT-FILE ASSIGN TO 'LPT1'.
       DATA DIVISION.
      * this is where memory space is allocated to data and identifiers
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
      * defines structure, size and type of the data
      * FD = File Descriptor. it names the input file and describes the structure of each record
       FD INPUT-FILE.
      * this is the group name and refers to all of the single record that is read from the file
      * higher numbers will contain individual fields in the record
       01 CUSTOMER-DATA.
      * PIC (short for picture) indicates the size and type of data in a field X(12) means 12 alphanumeric characters. can also be written as PIC XXXXXXXXXXXX
      * X = alphanumeric character. this can contain any ASCII character. it does not contain letters but the ASCII code for letters
       03 NAME PIC X(12).
      * this sub group has it's own sub groups.
       03 ADDRESS1.
      * PIC 9(2) = 9 = numeric field, (2) = 2 digits. calculations can be done on these
           05 HOUSE-NUMBER PIC 9(2).
           05 STREET PIC X(19).
           05 CITY PIC X(13).
       03 CUST-NUMBER PIC 9(6).
      *-----------------------
       WORKING-STORAGE SECTION.
      * defines data to be stored in temporary memory
       01 RECORD-COUNTER PIC 9(5).

       01 TOALS-IN.
      * number filled with zeroes
       03 1ST-NO PIC 99 VALUE ZERO.
      * number filled with 100
       03 2ND-NO PIC 999 VALUE 100.

      * string filled with spaces
       01 MESSAGE-1 PIC X(12) VALUE SPACES.

       01 TEXT-OUT PIC X(12) VALUE 'Hello World!'.
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
      *COBOL is a modular language. programs are usually broken up into units described as paragprahs

       MAIN-PROCEDURE.
      **
      * The main procedure of the program
      **
            DISPLAY "Hello world".
      ** add other procedures here

       CONTROL-PARAGRAPH.
           PERFORM READ-DATA-FILE
           PERFORM CALCULATE-PRICES
           PERFORM PRINT-PRICE-REPORT
       STOP RUN.

       NOT-HAPPENING.
           DISPLAY "This should not be visible.".

       READ-DATA-FILE.
           DISPLAY "Data read".

       CALCULATE-PRICES.
           DISPLAY MESSAGE-1.

       PRINT-PRICE-REPORT.
           DISPLAY TEXT-OUT.

       END Program HELLO-WORLD-PROG.
