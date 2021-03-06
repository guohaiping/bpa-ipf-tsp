C    %W% %G%
        subroutine openpf(pfname,*)
        character *(*) pfname

        include 'ipfinc/dtaiop.inc'
        include 'ipfinc/lfiles.inc' 

        character*10 pfcase

        datai = 3
	open (unit=datai,
     &        file=pfname,
     &        status='OLD',
c    &        readonly,
     &        form='UNFORMATTED',
c    &        shared,
     &        err=100)

        go to 200

100     return 1

200     pfcase = ' '
C
C      	OBTAIN DATA FROM INPUT FILE
C	Search DATAI OLDBASE for PFcase and load it into common
C        LOADED = 0 WHEN PFCASE WAS NOT FOUND IN DATAI  
C               = 1 WHEN PFCASE WAS FOUND AND LOADED    
C               = 2 WHEN DATAI WAS NOT A "PF DATA" HISTORY FILE
C
C	Open PF oldbase and load PFcase
C
        pfcase = ' '
        call rddtai(pfcase,loaded)                              

C
C       IF COUNT(1) = 0 THEN YOU HAVE A FAILED SOLUTION PF CASE.
C                   = 1 THEN YOU HAVE A SOLVED SOLUTION PF CASE.
C
        if ( count(1).eq.0) then                              
           write (*,105)
105        format (' THIS IS A FAILED SOLUTION CASE')
        endif                                                 

        if (loaded.eq.0) then
           write (*,110) 
110        format (' CASE NOT ON OLD-BASE FILE')     
        else if (loaded.eq.2) then
           write (*,115)
115        format (' NOT A POWERFLOW  OLD-BASE FILE') 
        else if(loaded.ge.3) then
           write (*,120)
120        format (' CASE NOT ACCESSIBLE')            
        endif

        close (unit = datai)

        if ((count(1).eq.0) .or. (loaded.ne.1)) return 1
   
        return

	end
