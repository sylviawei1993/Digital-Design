# 2비트 논리 게이트 Verilog 프로젝트

## 프로젝트 설명 
- 2개의 입력(DIP1, DIP2, DIP3)과 5개의 출력(LED1~LED5)을 갖는 논리 게이트
- - 논리: AND, OR, XOR, NOR, NAND
- 출력: DIP1, DIP2
- 입력: LED1~LED5 
- Logic: AND, OR, XOR, NOR, NAND


## 핀 연결 
- DIP1 → Y1, DIP2 → W3, DIP3 → U2 (FPGA DIP 스위치 )
- LED1 → L4, LED2 → M4, LED3 → M2, LED4 → N7, LED5 → M7(LED 출력 )

## 사용 방법 
1. logic_gates.v 파일을 FPGA 또는 시뮬레이션 소프트웨어에 로드합니다.
2. 입력 DIP 스위치를 설정하면 LED에 논리 결과가 출력됩니다.
3. Load the `logic_gates.v` file to FPGA or simulation software.
4. Set input DIP switches to see the LED outputs.
5. GitHub 링크에서 전체 코드를 확인할 수 있습니다.
