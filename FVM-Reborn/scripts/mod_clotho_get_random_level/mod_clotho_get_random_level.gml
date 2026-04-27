function mod_clotho_get_random_level(shape){
	
	if shape == 1 {
		
		var r = irandom(99); // 0~99 的整数

		if (r < 3) return 4;
		else if (r < 11) return 3;
		else if (r < 40) return 2;
		else return 1;
		
	} else if shape == 2 {
		
		var r = irandom(99); // 0~99 的整数

		if (r < 6) return 4;
		else if (r < 18) return 3;
		else if (r < 58) return 2;
		else return 1;
		
	} else if shape == 3 {
		
		var r = irandom(99); // 0~99 的整数

		if (r < 6) return 4;
		else if (r < 26) return 3;
		else if (r < 71) return 2;
		else return 1;
		
	} else {
		
		var r = irandom(99); // 0~99 的整数

		if (r < 2) return 4;          // 2%
		else if (r < 7) return 3;     // 2+5=7
		else if (r < 22) return 2;    // 7+15=22
		else if (r < 72) return 1;    // 22+50=72
		else if (r < 92) return -1;   // 72+20=92
		else return -2;               // 剩下 8%
	
	}

}