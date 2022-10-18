if exists('g:loaded_sysout')
	finish
else
	let g:loaed_sysout = 'yes'
endif

let g:sysout_below_map = '<leader>o'
let g:sysout_above_map = '<leader>O'

let s:sysout_langs = [
			\ ['c',               2,  'printf();'],
			\ ['cpp',             14, 'std::cout <<  << std::endl;'],
			\ ['cs',              2,  'System.Console.WriteLine();'],
			\ ['java',            2,  'System.out.println();'],
			\ ['python',          1,  'print()'],
			\ ['javascript',      2,  'console.log();'],
			\ ['typescript',      2,  'console.log();'],
			\ ['javascriptreact', 2,  'console.log();'],
			\ ['typescriptreact', 2,  'console.log();'],
			\ ['bash',            1,  'echo ""'],
			\ ['sh',              1,  'echo ""'],
			\ ]

function! s:setmap(v)
	execute 'autocmd FileType ' . a:v[0] . ' nmap ' . g:sysout_below_map . ' o' . a:v[2] . repeat('<Left>', a:v[1])
	execute 'autocmd FileType ' . a:v[0] . ' nmap ' . g:sysout_above_map . ' O' . a:v[2] . repeat('<Left>', a:v[1])
endfunction

for l in s:sysout_langs
	call s:setmap(l)
endfor

