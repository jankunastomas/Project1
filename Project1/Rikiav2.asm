; MASMTest.asm - add 32-bit integers
; Tomas Jankunas

.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data

.code
main proc
	mov eax,9
	mov ebx,3
;	mov ecx,5
;	mov edx,7
		cmp eax,ebx
		jg bottom1
		jl bottom2


	


	bottom11:
		xchg eax,ebx

	bottom2:


	invoke ExitProcess, 0

	main endp
	end main

;palyginam du pirmus registrus, jei pirmas didenis, nuðokam á L1
;palyginam antrà ir treèià registrus, jei antras didesnis, nuðokam á L2
;palyginam treèià ir ketvirtà registrus, jei treèias didesnis, nuðokam á L3, jei treèias maþesnis nuðokam á programos galà
;L1: sukeièiam vietomis pirmà su antru ir nuðokam á programos pradþià
;L2: sukeièiam vietomis antrà su treèiu ir nuðokam á programos pradþià
;L3: sukeièiam vietomis treèià su ketvirtu ir nuðokam á programos pradþià
;bottom: programos pabaiga