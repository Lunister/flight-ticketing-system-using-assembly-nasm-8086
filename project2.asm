[org 0x0100]

jmp start


welcome: dw "WELCOME TO SHAHEEN AIRWAYS"
welcomelength: dw 26

;------------------------AVAILABLE FLIGHTS---------------------------------

route1: dw "PSH TO LHR"
route1length: dw 10

option1: dw "Press 1 for Peshawar to Lahore "
lengthoption1: dw 31

route2: dw "PSH TO ISB"
route2length: dw 10

option2: dw "Press 2 for Peshawar to Islamabad "
lengthoption2: dw 34

route3: dw "PSH TO KHI"
route3length: dw 10

option3: dw "Press 3 for Peshawar to Karachi "
lengthoption3: dw 32

exitt: dw "Press 4 for exit"
exitlength: dw 16



anything: dw "Press 1 for Go to main Menu"
anythinglength: dw 27


anythingexit: dw "Press 2 to exit"
anythingexitlength: dw 16


routeinfo: dw 0
classinfo: dw 0
passengerval: db 0

;-------------------------CLASSES--------------------------------------


eco: dw "ECONOMY"
ecolength: dw 7

exec: dw "EXECUTIVE"
execlength: dw 9

busi: dw "BUSINESS"
busilength: dw 8

vip: dw "V.I.P"
viplength: dw 5

;--------------------------PESHAWAR TO LAHORE---------------------------------

pshtolhrEco: dw "Press 1 for ECONOMY CLASS---------RS:3500"
pshtolhrEcolength: dw 41


pshtolhrExe: dw "Press 2 for EXECUTIVE CLASS---------RS:5000"
pshtolhrExelength: dw 43


pshtolhrBus: dw "Press 3 for BUSINESS CLASS-----------RS:7000"
pshtolhrBuslength: dw 45

pshtolhrVip: dw "Press 4 for V.I.P. CLASS---------RS:10000"
pshtolhrViplength: dw 41


exitf: dw "Press 9 for exit"
exitflength: dw 16

exitmain: dw "Press Esc to return to Home"
exitmainlength: dw 27

;--------------------------PESHAWAR TO ISLAMABAD-------------------------------

pshtoisbEco: dw "Press 1 for ECONOMY CLASS---------Rs:2000"
pshtoisbEcolength: dw 41

pshtoisbExe: dw "Press 2 for EXECUTIVE CLASS---------RS:3000"
pshtoisbExelength: dw 43

pshtoisbBus: dw "Press 3 for BUSINESS CLASS-----------RS:4000"
pshtoisbBuslength: dw 44

pshtoisbVip: dw "Press 4 for V.I.P. CLASS---------RS:6000"
pshtoisbViplength: dw 41

;-------------------------PESHAWAR TO KARACHI----------------------------------

pshtokhiEco: dw "Press 1 for ECONOMY CLASS---------Rs:4000"
pshtokhiEcolength: dw 41

pshtokhiExe: dw "Press 2 for EXECUTIVE CLASS---------RS:7000"
pshtokhiExelength: dw 44

pshtokhiBus: dw "Press 3 for BUSINESS CLASS-----------RS:10000"
pshtokhiBuslength: dw 45

pshtokhiVip: dw "Press 4 for V.I.P. CLASS---------RS:15000"
pshtokhiViplength: dw 41



bill: dd 0

billintro: dw "INVOICE"
billintrolength: dw 7

billroute: dw "Selected Route --------------- "
billroutelength: dw 31

billclass: dw "Class ------------------------ "
billclasslength: dw 31

passenger: dw "Number of Passengers --------- "
passengerlength: dw 31

total: dw "TOTAL BILL ------------------- "
totallength: dw 31

askpass: dw "Enter the number of Passengers : "
askpasslength: dw 33

press1: dw "Press 1 for main menu"
press1length: dw 21

thank: dw "THANKS FOR CHOOSING SHAHEEN AIRWAYS"
thanklength: dw 35



clrscr:

	push dx
	push es
	push di


	mov dx, 0xb800
	mov es, dx
	mov di, 0


	s1:
		mov word [es:di], 0x0720
		add di, 2

		cmp di, 4000
		jne s1


	pop di
	pop es
	pop dx

	ret



screen:
	
	push bp
	mov bp, sp
	sub sp, 2
	
	push ax
	push bx
	push cx
	push dx
	push si
	push di


	mov ax, 0xb800
	mov es, ax
	mov di, 0


	mov si, [bp+4]
;	mov al, 32
	mov ax, 0x1020


	


	;Code for upper screen 
	
	l2:
		mov word[es:di], ax
		add di, 2

		cmp di,158
		jne l2



	
	;code for lower screen

	mov di, 3840

	l3:
		mov word[es:di], ax
		add di, 2

		cmp di,3998
		jne l3


	;code for left screen

	mov bx, 2
	mov cx, 1

	l4:
		
		mov ax, 80
		mul bx
		mul cx

		mov dx, 0x042A


		mov di, ax

		mov word[es:di],dx

		add cx, 1

		cmp cx, 24

		jne l4



	; code for right screen



	mov bx, 2
	mov cx, 0
	mov word [bp-2],158

	l5:
		
		mov ax, 80
		mul cx

		add ax, word[bp-2]

		mul bx

		mov dx, 0x042A

		mov di, ax

		mov word[es:di],dx

		add cx, 1

		cmp cx, 23

		jne l5



	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	add sp, 2
	pop bp



	ret 










mainmenu:
	push bx
	push cx
	push dx
	push si
	push di
	push es


	
	mov dx, 0xb800
	mov es, dx


	mov si, welcome
	mov di, 680
	mov cx, [welcomelength]

	m0:
		mov bh, 0x02
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop m0


	mov si, option1
	mov di, 1168
	mov cx, [lengthoption1]

	m1:
		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop m1

		mov si, option2
		mov di, 1488
		mov cx, [lengthoption2]

	m2:
		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop m2




		mov si, option3
		mov di, 1808
		mov cx, [lengthoption3]

	


	m3:
		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop m3



		mov si, exitt
		mov di, 2128
		mov cx, [exitlength]
	m4:
		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop m4

		prompt:

		mov ah, 0 ; service 0 – get keystroke
        int 0x16 ; call BIOS keyboard service
        
        cmp al, 49 ; is the Esc key pressed
        je function1


        cmp al, 50
        je function2

       
        cmp al, 51
        je function3


        cmp al, 52
        je exit

		cmp al , 27
		je exit

		jmp prompt
		jmp exit


        function1:
       	call PSHtoLHR
       	jmp exit


       function2:
       call PSHtoISB
       jmp exit


       function3:
       call PSHtoKHI
		jmp exit


        


    exit:
	
	pop es
	pop di
	pop si
	pop dx
	pop cx
	pop bx

	ret


PSHtoLHR:	
	
	call clrscr
	call screen
	
	push bx
	push cx
	push dx
	push si
	push di
	push es


	mov si, pshtolhrEco

	mov dx, 0xb800
	mov es, dx
	mov di, 678

	mov cx, [pshtolhrEcolength]

	f1:
		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop f1



	mov si, pshtolhrExe
	mov di, 998
	mov cx, [pshtolhrExelength]


	f2:

		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop f2





	mov si, pshtolhrBus
	mov di, 1318
	mov cx, [pshtolhrBuslength]


	f3:

		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop f3


	mov si, pshtolhrVip
	mov di, 1638
	mov cx, [pshtolhrViplength]


	f4:

		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop f4

	
	mov si, exitf
	mov di, 3238
	mov cx, [exitflength]


	f9:

		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop f9


	prom:

		mov ah, 0 ; service 0 – get keystroke
        int 0x16 ; call BIOS keyboard service
        
        cmp al, 49 
        je ff1


        cmp al, 50
        je ff2

       
        cmp al, 51
        je ff3

        cmp al,  52
        je ff4

		cmp al, 27
		je ff5call
		jne nextcall8

		ff5call:
			jmp ff5

		nextcall8:
		cmp al, 57
		jne prom

		jmp exitfast

        ff1:
			call getpassengers
			mov word[routeinfo] , 1
			mov word[classinfo] , 1
			xor bx , bx
			mov bl , [passengerval]
			mov ax , 3500
			mul bx
 	      	add word[bill], ax
			call calculateBill
        	jmp exitanythingfunction

        ff2:
			call getpassengers
			mov word[routeinfo] , 1
			mov word[classinfo] , 2
			xor bx , bx
			mov bl , [passengerval]
			mov ax , 5000
			mul bx
 	      	add word[bill], ax
			call calculateBill
        	jmp exitanythingfunction
        
        ff3:
			call getpassengers
			mov word[routeinfo] , 1
			mov word[classinfo] , 3
			xor bx , bx
			mov bl , [passengerval]
			mov ax , 7000
			mul bx
 	      	add word[bill], ax
			call calculateBill
        	jmp exitanythingfunction

        ff4:
			call getpassengers
			mov word[routeinfo] , 1
			mov word[classinfo] , 4
			xor bx , bx
			mov bl , [passengerval]
			mov ax , 10000
			mul bx
 	      	add word[bill], ax
			call calculateBill
        	jmp exitanythingfunction

		ff5:
			call anythingelse
			jmp exitfast

	exitfast:

	pop es
	pop di
	pop si
	pop dx
	pop cx
	pop bx
	ret

PSHtoISB:	
	
	call clrscr
	call screen
	
	push bx
	push cx
	push dx
	push si
	push di
	push es


	mov si, pshtoisbEco

	mov dx, 0xb800
	mov es, dx
	mov di, 678

	mov cx, [pshtoisbEcolength]

	i1:
		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop i1



	mov si, pshtoisbExe
	mov di, 998
	mov cx, [pshtoisbExelength]


	i2:

		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop i2





	mov si, pshtoisbBus
	mov di, 1318
	mov cx, [pshtoisbBuslength]


	i3:

		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop i3


	mov si, pshtoisbVip
	mov di, 1638
	mov cx, [pshtoisbViplength]


	i4:

		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop i4

	
	mov si, exitf
	mov di, 3238
	mov cx, [exitflength]


	i9:

		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop i9


	prom2:

		mov ah, 0 ; service 0 – get keystroke
        int 0x16 ; call BIOS keyboard service
        
        cmp al, 49 ; is the Esc key pressed
        je ii1


        cmp al, 50
        je ii2

       
        cmp al, 51
        je ii3

        cmp al,  52 ; is the Esc key pressed
        je ii4call
		jne nextcall11

		ii4call:
			jmp ii4

		nextcall11:
		cmp al, 57
		je exitisbcall
		jne nextcall9

		exitisbcall:
			jmp exitisb


		nextcall9:
		cmp al , 27
		je ii5call
		jne nextcall10

		ii5call:
			jmp ii5

		nextcall10:
	jmp prom2
	jmp exitisb

        ii1:
			xor ax , ax
			call getpassengers
			mov word[routeinfo] , 2
			mov word[classinfo] , 1
			xor bx , bx
			mov bl , [passengerval]
			mov ax , 2000
			mul bx
 	      	add word[bill], ax

			call calculateBill

        	jmp exitanythingfunction


        ii2:
			xor ax , ax
			call getpassengers
			mov word[routeinfo] , 2
			mov word[classinfo] , 2
			xor bx , bx
			mov bl , [passengerval]
			mov ax , 3000
			mul bx
 	      	add word[bill], ax

			call calculateBill

        	jmp exitanythingfunction


        
        ii3:
			xor ax , ax
			call getpassengers
			mov word[routeinfo] , 2
			mov word[classinfo] , 3
			xor bx , bx
			mov bl , [passengerval]
			mov ax , 4000
			mul bx
 	      	add word[bill], ax

			call calculateBill

        	jmp exitanythingfunction


        ii4:
			xor ax , ax
			call getpassengers
			mov word[routeinfo] , 2
			mov word[classinfo] , 4
			xor bx , bx
			mov bl , [passengerval]
			mov ax , 6000
			mul bx
 	      	add word[bill], ax

			call calculateBill

        	jmp exitanythingfunction

		ii5:
			call anythingelse

			jmp exitfast

	exitisb:

	pop es
	pop di
	pop si
	pop dx
	pop cx
	pop bx


	ret



PSHtoKHI:	
	
	call clrscr
	call screen
	
	push bx
	push cx
	push dx
	push si
	push di
	push es


	mov si, pshtokhiEco

	mov dx, 0xb800
	mov es, dx
	mov di, 678

	mov cx, [pshtokhiEcolength]

	k1:
		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop k1



	mov si, pshtokhiExe
	mov di, 998
	mov cx, [pshtokhiExelength]


	k2:

		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop k2





	mov si, pshtokhiBus
	mov di, 1318
	mov cx, [pshtokhiBuslength]


	k3:

		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop k3


	mov si, pshtokhiVip
	mov di, 1638
	mov cx, [pshtokhiViplength]


	k4:

		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop k4

	
	mov si, exitf
	mov di, 3238
	mov cx, [exitflength]


	k9:

		mov bh, 0x07
		mov bl, [si]

		mov word[es:di], bx

		add si,1

		add di, 2

		loop k9


	promp3:
		mov ah, 0 ; service 0 – get keystroke
        int 0x16 ; call BIOS keyboard service
        
        cmp al, 49 ; is the Esc key pressed
        je kk1


        cmp al, 50
        je kk2

       
        cmp al, 51
        je kk3


        cmp al,  52 ; is the Esc key pressed
        je kk4call
		jne nextcall12

		kk4call:
			jmp kk4

		nextcall12:
		cmp al, 57
		je exitkhicall
		jne nextcall13

		exitkhicall:
			jmp exitkhi

		nextcall13:
		cmp al, 27
		je kk5call
		jne nextcall14

		kk5call:
			jmp kk5

		nextcall14:
		jmp promp3
		jmp exitkhi

        kk1:
			xor ax , ax
			call getpassengers
			mov word[routeinfo] , 3
			mov word[classinfo] , 1
			xor bx , bx
			mov bl , [passengerval]
			mov ax , 4000
			mul bx
 	      	add word[bill], ax

			call calculateBill

        	jmp exitanythingfunction



        kk2:
			xor ax , ax
			call getpassengers
			mov word[routeinfo] , 3
			mov word[classinfo] , 2
			xor bx , bx
			mov bl , [passengerval]
			mov ax , 7000
			mul bx
 	      	add word[bill], ax

			call calculateBill

        	jmp exitanythingfunction
        
        kk3:
			xor ax , ax
			call getpassengers
			mov word[routeinfo] , 3
			mov word[classinfo] , 3
			xor bx , bx
			mov bl , [passengerval]
			mov ax , 10000
			mul bx
 	      	add word[bill], ax

			call calculateBill

        	jmp exitanythingfunction


        kk4:
			xor ax , ax
			call getpassengers
			mov word[routeinfo] , 3
			mov word[classinfo] , 4
			xor bx , bx
			mov bl , [passengerval]
			mov ax , 15000
			mul bx
 	      	add word[bill], ax

			call calculateBill

        	jmp exitanythingfunction
		
		
		kk5:

			call anythingelse

			jmp exitkhi

	exitkhi:

	pop es
	pop di
	pop si
	pop dx
	pop cx
	pop bx


	ret



anythingelse:
	
	call clrscr

	call screen
	
	push ax
	push bx
	push cx
	push dx
	push si
	push di
	push es


	mov bx, 0xb800
	mov es, bx
	mov di, 1328

	mov si, anything
	mov cx, [anythinglength]


	a1:
		mov dh, 0x07
		mov dl, [si]

		mov word [es:di], dx

		add si, 1

		add di, 2

		loop a1


	mov si, anythingexit
	mov cx, [anythingexitlength]
	mov di, 1648


	a2:
		mov dh, 0x07
		mov dl, [si]

		mov word [es:di], dx

		add si, 1

		add di, 2

		loop a2

	promp4:

		mov ah, 0
		int 0x16

		cmp al, 49
		je aa1

		cmp al, 50
		je aa2

		jmp promp4

		aa1:
			call clrscr
			call screen
			call mainmenu


		aa2:

			call calculateBill




	exitanythingfunction:

	pop es
	pop di
	pop si
	pop dx
	pop cx
	pop bx
	pop ax

	mov ax , 0x4c00
	int 0x21

	ret

getpassengers:
	push es
	push ax
	push dx
	push di
	push cx
	push si

	mov ax , 0xb800
	mov es , ax
	mov si , askpass
	mov di , 2918
	mov cx , [askpasslength]
	mov ah , 0x07

	loop100:
		mov al , [si]
		mov word[es:di], ax

		add si , 1
		add di , 2

		loop loop100


	xor ax , ax
	mov ah ,0
	int 0x16

	sub al , 30h

	mov byte[passengerval] , al


	pop si
	pop cx
	pop di
	pop dx
	pop ax
	pop es
	ret



calculateBill:
	
	

	call clrscr
	call screen


	push ax
	push bx
	push cx
	push dx
	push si
	push di
	push es

	mov ax ,0xb800
	mov es, ax
	mov di, 546

	mov ax , 0x022A
	mov cx , 11

	l6:
		mov word[es:di] , ax
		add di , 2

		loop l6


	mov di, 706

	mov ax ,  0x027C

	mov word[es:di] , ax

	add di, 4

	mov si,billintro
	mov cx,[billintrolength]

	xor ax, ax

	mov ah, 0x06

	l7:
		mov al , [si]
		mov word[es:di] , ax

		add si, 1
		add di, 2


		loop l7

	add di , 2

	mov ax , 0x027C

	mov word[es:di] , ax

	add di , 2

	mov di , 866
	mov cx , 11
	mov ax , 0x022A

	l8:
		mov word[es:di], ax

		add di , 2

		loop l8


	mov di , 1320
	mov si , billroute
	mov cx , [billroutelength]

	xor ax , ax

	mov ah , 0x07

	l9:
		mov al , [si]
		mov word[es:di] , ax

		add si , 1
		add di , 2

		loop l9
	
	cmp word[routeinfo] , 1
	je printlahore

	cmp word[routeinfo] , 2
	je printislamabad

	cmp word[routeinfo] , 3
	je printkarachi

		
		add di , 2

	
	printlahore:

		mov si , route1
		mov cx , [route1length]

		jmp printcity
	
	printislamabad:

		mov si , route2
		mov cx , [route2length]

		jmp printcity

	printkarachi:

		mov si , route3
		mov cx , [route3length]

		jmp printcity


	printcity:

	xor ax , ax

	mov ah , 0x07

		
	l10:
		mov al , [si]
		mov word[es:di] , ax

		add si , 1
		add di , 2

		loop l10


	mov di , 1640
	mov si , billclass
	mov cx , [billclasslength]

	xor ax , ax

	mov ah , 0x07

	l11:
		mov al , [si]
		mov word[es:di], ax

		add si , 1
		add di , 2

		loop l11

	
	cmp word[classinfo] , 1
	je printeconomy

	cmp word[classinfo] , 2
	je printexecutive

	cmp word[classinfo] , 3
	je printbusiness

	cmp word[classinfo] , 4
	je printvip

	printeconomy:
		mov si , eco
		mov cx , [ecolength]

		jmp printclass

	printbusiness:
		mov si , busi
		mov cx , [busilength]
		jmp printclass

	printexecutive:
		mov si , exec
		mov cx , [execlength]
		jmp printclass

	printvip:
		mov si , vip
		mov cx , [viplength]
		jmp printclass

	printclass:
		add di , 2
		xor ax , ax

		mov ah , 0x07

		l12:
			mov al , [si]

			mov word[es:di], ax

			add si , 1
			add di , 2

			loop l12


	mov di , 1960
	mov cx, [passengerlength]
	mov si , passenger

	xor ax, ax

	mov ah , 0x07

	l20:
		mov al , [si]
		mov word[es:di] , ax

		add si , 1
		add di , 2

		loop l20 


	add di , 4
	mov al , [passengerval]
	add al , 30h
	mov word[es:di] , ax



	mov di , 2120
	mov ax , 0x072D
	mov cx , 40

	l13:
		mov word[es:di] , ax

		add di , 2

		loop l13


	mov di , 2280
	mov si , total
	mov cx , [totallength]

	xor ax , ax

	mov ah , 0x07

	l14:
		mov al , [si]
		mov word[es:di], ax

		add si , 1
		add di , 2

		loop l14



	mov ax, word[bill]
	
	mov bx, 10
	mov cx, 0



	nextdigit:

		mov dx, 0

		div bx

		add dl, 0x30

		push dx

		inc cx 

		cmp ax, 0

		jnz nextdigit


	add di, 2

	nextpos:
		pop dx
		mov dh, 0x07

		mov word[es:di], dx

		add di, 2
		loop nextpos





	mov di, 2916

	mov si,thank
	mov cx,[thanklength]

	xor ax, ax

	mov ah, 0x09
	


	cc1:
		mov al, [si]

		mov word[es:di],ax


		add si, 1
		add di, 2


		loop cc1

	mov di , 3690
	mov si , press1
	mov cx , [press1length]

	xor ax , ax

	mov ah , 0x07

	l110:
		mov al , [si]
		mov word[es:di], ax

		add si , 1
		add di , 2

		loop l110

	xor ax ,ax

		mov ah, 0
		int 0x16

		cmp al, 49
		je start

		jmp exitanythingfunction

		pop es
		pop di
		pop si
		pop dx
		pop cx
		pop bx
		pop ax

		ret 



cleardata:
	
	mov word[bill] , 0
	mov word[routeinfo], 0
	mov word[classinfo], 0
	mov byte[passengerval], 0

	ret


start:

	call cleardata
	call clrscr
	call cleardata
	call screen
	call mainmenu
	
	mov ah, 0x1
	int 0x21

	mov ax, 0x4c00
	int 0x21