; MASMTest.asm - add 32-bit integers
; Tomas Jankunas

.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data

.code
main proc
	mov eax,2
	mov ebx,8
	mov ecx,5
	mov edx,1

	top:
		cmp eax,ebx
		jg L1
		jl L2

	L1:	xchg eax,ebx

	L2:
		cmp ebx,ecx
		jg L3
		jl L5
	
	L3:	xchg ebx,ecx
		
		cmp ecx,edx
		jg L4
		jl top

	L5:
		cmp ecx,edx
		jl bottom

	L4: xchg ecx,edx

		cmp ecx,edx
		jl top

	bottom: 

	invoke ExitProcess, 0

	main endp
	end main

;palyginam du pirmus registrus, jei pirmas didenis, nu�okam � L1
;palyginam antr� ir tre�i� registrus, jei antras didesnis, nu�okam � L2
;palyginam tre�i� ir ketvirt� registrus, jei tre�ias didesnis, nu�okam � L3, jei tre�ias ma�esnis nu�okam � programos gal�
;L1: sukei�iam vietomis pirm� su antru ir nu�okam � programos prad�i�
;L2: sukei�iam vietomis antr� su tre�iu ir nu�okam � programos prad�i�
;L3: sukei�iam vietomis tre�i� su ketvirtu ir nu�okam � programos prad�i�
;bottom: programos pabaiga