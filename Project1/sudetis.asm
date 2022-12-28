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

;palyginam du pirmus registrus, jei pirmas didenis, nuðokam á L1
;palyginam antrà ir treèià registrus, jei antras didesnis, nuðokam á L2
;palyginam treèià ir ketvirtà registrus, jei treèias didesnis, nuðokam á L3, jei treèias maþesnis nuðokam á programos galà
;L1: sukeièiam vietomis pirmà su antru ir nuðokam á programos pradþià
;L2: sukeièiam vietomis antrà su treèiu ir nuðokam á programos pradþià
;L3: sukeièiam vietomis treèià su ketvirtu ir nuðokam á programos pradþià
;bottom: programos pabaiga