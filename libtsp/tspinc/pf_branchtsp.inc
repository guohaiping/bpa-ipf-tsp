       integer pf_kbrnch(18,PF_MAXBRN),
     &         pf_brnch_ptr, pf_brnch_nxt, pf_brsect,
     &         pf_brtype, pf_ltot2, pf_kx, pf_ky
       real pf_rateln, pf_brnch
       character pf_brid*1
       equivalence (pf_brnch,pf_kbrnch)

       common /branch/ pf_ltot2, pf_kx(0:PF_MAXBRN*2),
     &   pf_ky(0:PF_MAXBRN*2), pf_brsect(0:PF_MAXBRN*2), 
     &   pf_brtype(0:PF_MAXBRN*2), pf_brnch(18,PF_MAXBRN), 
     &   pf_rateln(3,PF_MAXBRN),pf_brnch_ptr(0:PF_MAXBRN*2), 
     &   pf_brnch_nxt(0:PF_MAXBRN*2)

       common /branchc/ pf_brid(0:PF_MAXBRN*2)

