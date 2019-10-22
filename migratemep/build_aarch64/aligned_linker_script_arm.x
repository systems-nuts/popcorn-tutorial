/* Default linker script, for normal executables */
OUTPUT_FORMAT("elf64-littleaarch64", "elf64-bigaarch64",
	      "elf64-littleaarch64")
OUTPUT_ARCH(aarch64)
ENTRY(_start)
SECTIONS
{
  /* Read-only sections, merged into text segment: */
  PROVIDE (__executable_start = SEGMENT_START("text-segment", 0x400000)); . = SEGMENT_START("text-segment", 0x400000) + SIZEOF_HEADERS;
  .interp         : { *(.interp) }
/*  .note.gnu.build-id : { *(.note.gnu.build-id) }*/
  .hash           : { *(.hash) }
  .gnu.hash       : { *(.gnu.hash) }
  .dynsym         : { *(.dynsym) }
  .dynstr         : { *(.dynstr) }
  .gnu.version    : { *(.gnu.version) }
  .gnu.version_d  : { *(.gnu.version_d) }
  .gnu.version_r  : { *(.gnu.version_r) }
  .rela.init      : { *(.rela.init) }
  .rela.text      : { *(.rela.text .rela.text.* .rela.gnu.linkonce.t.*) }
  .rela.fini      : { *(.rela.fini) }
  .rela.rodata    : { *(.rela.rodata .rela.rodata.* .rela.gnu.linkonce.r.*) }
  .rela.data.rel.ro   : { *(.rela.data.rel.ro .rela.data.rel.ro.* .rela.gnu.linkonce.d.rel.ro.*) }
  .rela.data      : { *(.rela.data .rela.data.* .rela.gnu.linkonce.d.*) }
  .rela.tdata	  : { *(.rela.tdata .rela.tdata.* .rela.gnu.linkonce.td.*) }
  .rela.tbss	  : { *(.rela.tbss .rela.tbss.* .rela.gnu.linkonce.tb.*) }
  .rela.ctors     : { *(.rela.ctors) }
  .rela.dtors     : { *(.rela.dtors) }
  .rela.got       : { *(.rela.got) }
  .rela.bss       : { *(.rela.bss .rela.bss.* .rela.gnu.linkonce.b.*) }
  .rela.ifunc     : { *(.rela.ifunc) }
  .rela.plt       :
    {
      *(.rela.plt)
      PROVIDE_HIDDEN (__rela_iplt_start = .);
      *(.rela.iplt)
      PROVIDE_HIDDEN (__rela_iplt_end = .);
    }
  .init           :
  {
    /*KEEP (*(SORT_NONE(.init)))*/
  }
  .plt            : ALIGN(16) { *(.plt) *(.iplt) }
  
.text	: ALIGN(0x100000)
{
	. = . + 1;
	. = ALIGN(0x1000);
	. = ALIGN(0x4); /* align for .text.exit */
	"/usr/local/popcorn/aarch64/lib/libc.a(exit.o)"(.text.exit); /* size 0x24 */
	. = ALIGN(0x10); /* align for .text.migrateme */
	"popcorn-migratemep_aarch64.o"(.text.migrateme); /* size 0x80 */
	. = ALIGN(0x10); /* align for .text.thread */
	"popcorn-migratemep_aarch64.o"(.text.thread); /* size 0x84 */
	. = ALIGN(0x10); /* align for .text.main */
	"popcorn-migratemep_aarch64.o"(.text.main); /* size 0xcc */
	. = ALIGN(0x4); /* align for .text._start_c */
	"/usr/local/popcorn/aarch64/lib/crt1.o"(.text._start_c); /* size 0x34 */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.dummy1 */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.text.dummy1); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.__init_libc */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.text.__init_libc); /* size 0x1d8 */
	. = ALIGN(0x4); /* align for .text.libc_start_init */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.text.libc_start_init); /* size 0x40 */
	. = ALIGN(0x4); /* align for .text.__libc_start_main */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.text.__libc_start_main); /* size 0x50 */
	. = ALIGN(0x4); /* align for .text.libc_exit_fini */
	"/usr/local/popcorn/aarch64/lib/libc.a(exit.o)"(.text.libc_exit_fini); /* size 0x3c */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(exit.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.perror */
	"/usr/local/popcorn/aarch64/lib/libc.a(perror.o)"(.text.perror); /* size 0xcc */
	. = ALIGN(0x4); /* align for .text.printf */
	"/usr/local/popcorn/aarch64/lib/libc.a(printf.o)"(.text.printf); /* size 0x88 */
	. = . + 0x21; /* padding after .text.printf */
	. = ALIGN(0x4); /* align for .text.vfprintf */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.text.vfprintf); /* size 0x1a0 */
	. = . + 0x1a; /* padding after .text.vfprintf */
	. = ALIGN(0x4); /* align for .text.printf_core */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.text.printf_core); /* size 0x1cc4 */
	. = . + 0x142; /* padding after .text.printf_core */
	. = ALIGN(0x4); /* align for .text.getint */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.text.getint); /* size 0x74 */
	. = ALIGN(0x4); /* align for .text.pop_arg */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.text.pop_arg); /* size 0x27c */
	. = ALIGN(0x4); /* align for .text.pad */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.text.pad); /* size 0xc4 */
	. = ALIGN(0x10); /* align for .text.strlen */
	"/usr/local/popcorn/aarch64/lib/libc.a(strlen.o)"(.text.strlen); /* size 0x60 */
	. = . + 0x1; /* padding after .text.strlen */
	. = ALIGN(0x10); /* align for .text.strnlen */
	"/usr/local/popcorn/aarch64/lib/libc.a(strnlen.o)"(.text.strnlen); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.memset */
	"/usr/local/popcorn/aarch64/lib/libc.a(memset.o)"(.text.memset); /* size 0x158 */
	. = ALIGN(0x4); /* align for .text.dummy_0 */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_create.o)"(.text.dummy_0); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.__pthread_exit */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_create.o)"(.text.__pthread_exit); /* size 0x1b0 */
	. = . + 0xd; /* padding after .text.__pthread_exit */
	. = ALIGN(0x4); /* align for .text.__do_cleanup_push */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_create.o)"(.text.__do_cleanup_push); /* size 0x14 */
	. = . + 0x8; /* padding after .text.__do_cleanup_push */
	. = ALIGN(0x4); /* align for .text.__do_cleanup_pop */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_create.o)"(.text.__do_cleanup_pop); /* size 0x10 */
	. = . + 0x5; /* padding after .text.__do_cleanup_pop */
	. = ALIGN(0x4); /* align for .text.__pthread_create */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_create.o)"(.text.__pthread_create); /* size 0x530 */
	. = . + 0x85; /* padding after .text.__pthread_create */
	. = ALIGN(0x4); /* align for .text.start_c11 */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_create.o)"(.text.start_c11); /* size 0x1c */
	. = ALIGN(0x4); /* align for .text.start */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_create.o)"(.text.start); /* size 0x8c */
	. = . + 0x9; /* padding after .text.start */
	. = ALIGN(0x4); /* align for .text.__pthread_timedjoin_np */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_join.o)"(.text.__pthread_timedjoin_np); /* size 0x100 */
	. = ALIGN(0x4); /* align for .text.__pthread_join */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_join.o)"(.text.__pthread_join); /* size 0x8 */
	. = ALIGN(0x4); /* align for .text.__pthread_tryjoin_np */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_join.o)"(.text.__pthread_tryjoin_np); /* size 0x28 */
	. = ALIGN(0x4); /* align for .text.__pthread_setcancelstate */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_setcancelstate.o)"(.text.__pthread_setcancelstate); /* size 0x34 */
	. = ALIGN(0x4); /* align for .text.__pthread_testcancel */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_testcancel.o)"(.text.__pthread_testcancel); /* size 0x4 */
	. = . + 0x3; /* padding after .text.__pthread_testcancel */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_testcancel.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.__vm_wait */
	"/usr/local/popcorn/aarch64/lib/libc.a(vmlock.o)"(.text.__vm_wait); /* size 0x44 */
	. = ALIGN(0x4); /* align for .text.__vm_lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(vmlock.o)"(.text.__vm_lock); /* size 0x1c */
	. = ALIGN(0x4); /* align for .text.__vm_unlock */
	"/usr/local/popcorn/aarch64/lib/libc.a(vmlock.o)"(.text.__vm_unlock); /* size 0x60 */
	. = ALIGN(0x1); /* align for .text.__cleartid_exit_nostack */
	"/usr/local/popcorn/aarch64/lib/libc.a(__cleartid_exit_nostack.o)"(.text.__cleartid_exit_nostack); /* size 0x28 */
	. = . + 0x6; /* padding after .text.__cleartid_exit_nostack */
	. = ALIGN(0x10); /* align for .text.__unmapself */
	"/usr/local/popcorn/aarch64/lib/libc.a(__unmapself.o)"(.text.__unmapself); /* size 0x10 */
	. = . + 0x1; /* padding after .text.__unmapself */
	. = ALIGN(0x10); /* align for .text.__clone */
	"/usr/local/popcorn/aarch64/lib/libc.a(clone.o)"(.text.__clone); /* size 0x38 */
	. = . + 0x1; /* padding after .text.__clone */
	. = ALIGN(0x4); /* align for .text.getpid */
	"/usr/local/popcorn/aarch64/lib/libc.a(getpid.o)"(.text.getpid); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.gettid */
	"/usr/local/popcorn/aarch64/lib/libc.a(gettid.o)"(.text.gettid); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.sleep */
	"/usr/local/popcorn/aarch64/lib/libc.a(sleep.o)"(.text.sleep); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.__init_tp */
	"/usr/local/popcorn/aarch64/lib/libc.a(__init_tls.o)"(.text.__init_tp); /* size 0x74 */
	. = ALIGN(0x4); /* align for .text.__copy_tls */
	"/usr/local/popcorn/aarch64/lib/libc.a(__init_tls.o)"(.text.__copy_tls); /* size 0x9c */
	. = . + 0x2; /* padding after .text.__copy_tls */
	. = ALIGN(0x4); /* align for .text.static_init_tls */
	"/usr/local/popcorn/aarch64/lib/libc.a(__init_tls.o)"(.text.static_init_tls); /* size 0x158 */
	. = ALIGN(0x4); /* align for .text.__errno_location */
	"/usr/local/popcorn/aarch64/lib/libc.a(__errno_location.o)"(.text.__errno_location); /* size 0xc */
	. = . + 0x2; /* padding after .text.__errno_location */
	. = ALIGN(0x4); /* align for .text.__strerror_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(strerror.o)"(.text.__strerror_l); /* size 0x60 */
	. = ALIGN(0x4); /* align for .text.strerror */
	"/usr/local/popcorn/aarch64/lib/libc.a(strerror.o)"(.text.strerror); /* size 0xc */
	. = . + 0x9; /* padding after .text.strerror */
	. = ALIGN(0x4); /* align for .text._Exit */
	"/usr/local/popcorn/aarch64/lib/libc.a(_Exit.o)"(.text._Exit); /* size 0x20 */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(__lctrans.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.__lctrans */
	"/usr/local/popcorn/aarch64/lib/libc.a(__lctrans.o)"(.text.__lctrans); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__lctrans */
	. = ALIGN(0x4); /* align for .text.__lctrans_cur */
	"/usr/local/popcorn/aarch64/lib/libc.a(__lctrans.o)"(.text.__lctrans_cur); /* size 0x10 */
	. = . + 0x9; /* padding after .text.__lctrans_cur */
	. = ALIGN(0x4); /* align for .text.__fpclassifyl */
	"/usr/local/popcorn/aarch64/lib/libc.a(__fpclassifyl.o)"(.text.__fpclassifyl); /* size 0x54 */
	. = . + 0x1; /* padding after .text.__fpclassifyl */
	. = ALIGN(0x4); /* align for .text.__signbitl */
	"/usr/local/popcorn/aarch64/lib/libc.a(__signbitl.o)"(.text.__signbitl); /* size 0x18 */
	. = ALIGN(0x4); /* align for .text.frexpl */
	"/usr/local/popcorn/aarch64/lib/libc.a(frexpl.o)"(.text.frexpl); /* size 0xb4 */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(mmap.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.__mmap */
	"/usr/local/popcorn/aarch64/lib/libc.a(mmap.o)"(.text.__mmap); /* size 0xc0 */
	. = ALIGN(0x4); /* align for .text.__mprotect */
	"/usr/local/popcorn/aarch64/lib/libc.a(mprotect.o)"(.text.__mprotect); /* size 0x48 */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(munmap.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.__munmap */
	"/usr/local/popcorn/aarch64/lib/libc.a(munmap.o)"(.text.__munmap); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.wctomb */
	"/usr/local/popcorn/aarch64/lib/libc.a(wctomb.o)"(.text.wctomb); /* size 0x24 */
	. = ALIGN(0x4); /* align for .text.__block_all_sigs */
	"/usr/local/popcorn/aarch64/lib/libc.a(block.o)"(.text.__block_all_sigs); /* size 0x24 */
	. = ALIGN(0x4); /* align for .text.__block_app_sigs */
	"/usr/local/popcorn/aarch64/lib/libc.a(block.o)"(.text.__block_app_sigs); /* size 0x24 */
	. = ALIGN(0x4); /* align for .text.__restore_sigs */
	"/usr/local/popcorn/aarch64/lib/libc.a(block.o)"(.text.__restore_sigs); /* size 0x20 */
	. = ALIGN(0x4); /* align for .text.__lockfile */
	"/usr/local/popcorn/aarch64/lib/libc.a(__lockfile.o)"(.text.__lockfile); /* size 0x70 */
	. = . + 0x2; /* padding after .text.__lockfile */
	. = ALIGN(0x4); /* align for .text.__unlockfile */
	"/usr/local/popcorn/aarch64/lib/libc.a(__lockfile.o)"(.text.__unlockfile); /* size 0x4c */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(__stdio_close.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.__stdio_close */
	"/usr/local/popcorn/aarch64/lib/libc.a(__stdio_close.o)"(.text.__stdio_close); /* size 0x28 */
	. = ALIGN(0x4); /* align for .text.__stdio_seek */
	"/usr/local/popcorn/aarch64/lib/libc.a(__stdio_seek.o)"(.text.__stdio_seek); /* size 0x14 */
	. = . + 0x2; /* padding after .text.__stdio_seek */
	. = ALIGN(0x4); /* align for .text.__stdio_write */
	"/usr/local/popcorn/aarch64/lib/libc.a(__stdio_write.o)"(.text.__stdio_write); /* size 0x138 */
	. = ALIGN(0x4); /* align for .text.__stdout_write */
	"/usr/local/popcorn/aarch64/lib/libc.a(__stdout_write.o)"(.text.__stdout_write); /* size 0x68 */
	. = ALIGN(0x4); /* align for .text.fputc */
	"/usr/local/popcorn/aarch64/lib/libc.a(fputc.o)"(.text.fputc); /* size 0xd4 */
	. = ALIGN(0x4); /* align for .text.__fwritex */
	"/usr/local/popcorn/aarch64/lib/libc.a(fwrite.o)"(.text.__fwritex); /* size 0xf4 */
	. = ALIGN(0x4); /* align for .text.fwrite */
	"/usr/local/popcorn/aarch64/lib/libc.a(fwrite.o)"(.text.fwrite); /* size 0x9c */
	. = ALIGN(0x4); /* align for .text.__ofl_lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(ofl.o)"(.text.__ofl_lock); /* size 0x24 */
	. = ALIGN(0x4); /* align for .text.__ofl_unlock */
	"/usr/local/popcorn/aarch64/lib/libc.a(ofl.o)"(.text.__ofl_unlock); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.memchr */
	"/usr/local/popcorn/aarch64/lib/libc.a(memchr.o)"(.text.memchr); /* size 0xb0 */
	. = . + 0x30; /* padding after .text.memchr */
	. = ALIGN(0x4); /* align for .text.memcpy */
	"/usr/local/popcorn/aarch64/lib/libc.a(memcpy.o)"(.text.memcpy); /* size 0x3e0 */
	. = ALIGN(0x4); /* align for .text.__lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(__lock.o)"(.text.__lock); /* size 0x64 */
	. = ALIGN(0x4); /* align for .text.__unlock */
	"/usr/local/popcorn/aarch64/lib/libc.a(__lock.o)"(.text.__unlock); /* size 0x54 */
	. = ALIGN(0x4); /* align for .text.__timedwait_cp */
	"/usr/local/popcorn/aarch64/lib/libc.a(__timedwait.o)"(.text.__timedwait_cp); /* size 0x138 */
	. = ALIGN(0x4); /* align for .text.__timedwait */
	"/usr/local/popcorn/aarch64/lib/libc.a(__timedwait.o)"(.text.__timedwait); /* size 0x70 */
	. = ALIGN(0x4); /* align for .text.__wait */
	"/usr/local/popcorn/aarch64/lib/libc.a(__wait.o)"(.text.__wait); /* size 0xc4 */
	. = ALIGN(0x10); /* align for .text.__set_thread_area */
	"/usr/local/popcorn/aarch64/lib/libc.a(__set_thread_area.o)"(.text.__set_thread_area); /* size 0xc */
	. = . + 0x4; /* padding after .text.__set_thread_area */
	. = ALIGN(0x4); /* align for .text.__clock_gettime */
	"/usr/local/popcorn/aarch64/lib/libc.a(clock_gettime.o)"(.text.__clock_gettime); /* size 0x68 */
	. = ALIGN(0x4); /* align for .text.nanosleep */
	"/usr/local/popcorn/aarch64/lib/libc.a(nanosleep.o)"(.text.nanosleep); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.__syscall_ret */
	"/usr/local/popcorn/aarch64/lib/libc.a(syscall_ret.o)"(.text.__syscall_ret); /* size 0x30 */
	. = ALIGN(0x4); /* align for .text.wcrtomb */
	"/usr/local/popcorn/aarch64/lib/libc.a(wcrtomb.o)"(.text.wcrtomb); /* size 0x10c */
	. = . + 0xc; /* padding after .text.wcrtomb */
	. = ALIGN(0x4); /* align for .text.__overflow */
	"/usr/local/popcorn/aarch64/lib/libc.a(__overflow.o)"(.text.__overflow); /* size 0xa8 */
	. = ALIGN(0x4); /* align for .text.__towrite */
	"/usr/local/popcorn/aarch64/lib/libc.a(__towrite.o)"(.text.__towrite); /* size 0x50 */
	. = ALIGN(0x4); /* align for .text.__towrite_needs_stdio_exit */
	"/usr/local/popcorn/aarch64/lib/libc.a(__towrite.o)"(.text.__towrite_needs_stdio_exit); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__towrite_needs_stdio_exit */
	. = ALIGN(0x4); /* align for .text.sccp */
	"/usr/local/popcorn/aarch64/lib/libc.a(__syscall_cp.o)"(.text.sccp); /* size 0x4 */
	. = . + 0xf; /* padding after .text.sccp */
	. = ALIGN(0x4); /* align for .text.__syscall_cp */
	"/usr/local/popcorn/aarch64/lib/libc.a(__syscall_cp.o)"(.text.__syscall_cp); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__syscall_cp */
	. = ALIGN(0x10); /* align for .text.__syscall */
	"/usr/local/popcorn/aarch64/lib/libc.a(syscall.o)"(.text.__syscall); /* size 0x28 */
	. = ALIGN(0x4); /* align for .text.__stdio_exit */
	"/usr/local/popcorn/aarch64/lib/libc.a(__stdio_exit.o)"(.text.__stdio_exit); /* size 0x48 */
	. = ALIGN(0x4); /* align for .text.close_file */
	"/usr/local/popcorn/aarch64/lib/libc.a(__stdio_exit.o)"(.text.close_file); /* size 0x70 */
	. = ALIGN(0x10); /* align for .text.node_available */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.node_available); /* size 0x30 */
	. = ALIGN(0x10); /* align for .text.total_act_nodes */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.total_act_nodes); /* size 0x40 */
	. = . + 0x52; /* padding after .text.total_act_nodes */
	. = ALIGN(0x10); /* align for .text.current_arch */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.current_arch); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.current_nid */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.current_nid); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.__init_nodes_info */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.__init_nodes_info); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.__migrate_shim_internal */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.__migrate_shim_internal); /* size 0x590 */
	. = . + 0x4; /* padding after .text.__migrate_shim_internal */
	. = ALIGN(0x10); /* align for .text.check_migrate */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.check_migrate); /* size 0x68 */
	. = ALIGN(0x10); /* align for .text.migrate */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.migrate); /* size 0x48 */
	. = ALIGN(0x10); /* align for .text.migrate_schedule */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.migrate_schedule); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.get_call_site */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.get_call_site); /* size 0x8 */
	. = . + 0x2; /* padding after .text.get_call_site */
	. = ALIGN(0x10); /* align for .text.clear_migrate_flag */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(trigger.o)"(.text.clear_migrate_flag); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.__register_migrate_sighandler */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(trigger.o)"(.text.__register_migrate_sighandler); /* size 0x5c */
	. = . + 0x15; /* padding after .text.__register_migrate_sighandler */
	. = ALIGN(0x10); /* align for .text.__migrate_sighandler */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(trigger.o)"(.text.__migrate_sighandler); /* size 0x5c */
	. = ALIGN(0x1); /* align for .text.__migrate_fixup_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate_x86_64.o)"(.text.__migrate_fixup_x86_64); /* size 0x0 */
	. = . + 0x69; /* padding after .text.__migrate_fixup_x86_64 */
	. = ALIGN(0x10); /* align for .text.__migrate_fixup_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate_aarch64.o)"(.text.__migrate_fixup_aarch64); /* size 0x7c */
	. = ALIGN(0x10); /* align for .text.__migrate_fixup_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate_powerpc64.o)"(.text.__migrate_fixup_powerpc64); /* size 0x0 */
	. = ALIGN(0x10); /* align for .text.set_default_node */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.text.set_default_node); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.cleanup */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.text.cleanup); /* size 0xac */
	. = ALIGN(0x10); /* align for .text.region_compare */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.text.region_compare); /* size 0x28 */
	. = ALIGN(0x10); /* align for .text.read_mapping_schedule */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.text.read_mapping_schedule); /* size 0x360 */
	. = ALIGN(0x10); /* align for .text.region_find */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.text.region_find); /* size 0x28 */
	. = ALIGN(0x10); /* align for .text.get_node_mapping */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.text.get_node_mapping); /* size 0x98 */
	. = ALIGN(0x10); /* align for .text.__st_userspace_ctor */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.text.__st_userspace_ctor); /* size 0x338 */
	. = . + 0x69; /* padding after .text.__st_userspace_ctor */
	. = ALIGN(0x10); /* align for .text.__st_userspace_dtor */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.text.__st_userspace_dtor); /* size 0x98 */
	. = ALIGN(0x10); /* align for .text.get_stack_bounds */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.text.get_stack_bounds); /* size 0xe4 */
	. = ALIGN(0x10); /* align for .text.st_userspace_rewrite */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.text.st_userspace_rewrite); /* size 0x174 */
	. = ALIGN(0x10); /* align for .text.__st_ctor */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.text.__st_ctor); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__st_ctor */
	. = ALIGN(0x10); /* align for .text.__st_dtor */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.text.__st_dtor); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__st_dtor */
	. = ALIGN(0x10); /* align for .text.st_init */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.text.st_init); /* size 0x1e8 */
	. = . + 0x2a; /* padding after .text.st_init */
	. = ALIGN(0x10); /* align for .text.st_destroy */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.text.st_destroy); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.st_rewrite_stack */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.text.st_rewrite_stack); /* size 0x71c */
	. = . + 0xaa; /* padding after .text.st_rewrite_stack */
	. = ALIGN(0x10); /* align for .text.rewrite_frame */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.text.rewrite_frame); /* size 0x4b8 */
	. = ALIGN(0x10); /* align for .text.st_rewrite_ondemand */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.text.st_rewrite_ondemand); /* size 0x2c */
	. = ALIGN(0x10); /* align for .text.rewrite_val */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.text.rewrite_val); /* size 0x370 */
	. = ALIGN(0x10); /* align for .text.first_frame */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(unwind.o)"(.text.first_frame); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.calculate_cfa */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(unwind.o)"(.text.calculate_cfa); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.bootstrap_first_frame */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(unwind.o)"(.text.bootstrap_first_frame); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.bootstrap_first_frame_funcentry */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(unwind.o)"(.text.bootstrap_first_frame_funcentry); /* size 0x64 */
	. = ALIGN(0x10); /* align for .text.pop_frame */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(unwind.o)"(.text.pop_frame); /* size 0x258 */
	. = ALIGN(0x10); /* align for .text.pop_frame_funcentry */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(unwind.o)"(.text.pop_frame_funcentry); /* size 0x198 */
	. = ALIGN(0x10); /* align for .text.get_register_save_loc */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(unwind.o)"(.text.get_register_save_loc); /* size 0x84 */
	. = ALIGN(0x10); /* align for .text.clear_activation */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(unwind.o)"(.text.clear_activation); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.arch_name */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.arch_name); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.get_regops */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.get_regops); /* size 0x48 */
	. = ALIGN(0x10); /* align for .text.get_properties */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.get_properties); /* size 0x48 */
	. = ALIGN(0x10); /* align for .text.get_section */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.get_section); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.get_num_entries */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.get_num_entries); /* size 0x64 */
	. = ALIGN(0x10); /* align for .text.get_section_data */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.get_section_data); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.get_site_by_addr */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.get_site_by_addr); /* size 0xa4 */
	. = ALIGN(0x10); /* align for .text.get_site_by_id */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.get_site_by_id); /* size 0x90 */
	. = ALIGN(0x10); /* align for .text.get_unwind_offset_by_addr */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.get_unwind_offset_by_addr); /* size 0xb4 */
	. = ALIGN(0x10); /* align for .text.get_function_address */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.get_function_address); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.align_sp_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.text.align_sp_aarch64); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.is_callee_saved_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.text.is_callee_saved_aarch64); /* size 0x30 */
	. = ALIGN(0x10); /* align for .text.callee_reg_size_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.text.callee_reg_size_aarch64); /* size 0x58 */
	. = ALIGN(0x10); /* align for .text.regset_default_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_default_aarch64); /* size 0xc */
	. = . + 0x3; /* padding after .text.regset_default_aarch64 */
	. = ALIGN(0x10); /* align for .text.regset_init_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_init_aarch64); /* size 0x38 */
	. = ALIGN(0x10); /* align for .text.regset_free_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_free_aarch64); /* size 0x4 */
	. = . + 0x1; /* padding after .text.regset_free_aarch64 */
	. = ALIGN(0x10); /* align for .text.regset_clone_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_clone_aarch64); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.regset_copyin_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_copyin_aarch64); /* size 0x8 */
	. = . + 0x2; /* padding after .text.regset_copyin_aarch64 */
	. = ALIGN(0x10); /* align for .text.regset_copyout_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_copyout_aarch64); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.pc_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.pc_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.sp_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.sp_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.fbp_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.fbp_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.ra_reg_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.ra_reg_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_pc_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_pc_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_sp_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_sp_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_fbp_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_fbp_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_ra_reg_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_ra_reg_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.setup_fbp_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.setup_fbp_aarch64); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.reg_size_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.reg_size_aarch64); /* size 0x54 */
	. = ALIGN(0x10); /* align for .text.reg_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.reg_aarch64); /* size 0x338 */
	. = ALIGN(0x10); /* align for .text.align_sp_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.text.align_sp_powerpc64); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.is_callee_saved_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.text.is_callee_saved_powerpc64); /* size 0x2c */
	. = ALIGN(0x10); /* align for .text.callee_reg_size_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.text.callee_reg_size_powerpc64); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.regset_default_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_default_powerpc64); /* size 0xc */
	. = . + 0x3; /* padding after .text.regset_default_powerpc64 */
	. = ALIGN(0x10); /* align for .text.regset_init_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_init_powerpc64); /* size 0x38 */
	. = ALIGN(0x10); /* align for .text.regset_free_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_free_powerpc64); /* size 0x4 */
	. = . + 0x1; /* padding after .text.regset_free_powerpc64 */
	. = ALIGN(0x10); /* align for .text.regset_clone_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_clone_powerpc64); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.regset_copyin_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_copyin_powerpc64); /* size 0x8 */
	. = . + 0x2; /* padding after .text.regset_copyin_powerpc64 */
	. = ALIGN(0x10); /* align for .text.regset_copyout_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_copyout_powerpc64); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.pc_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.pc_powerpc64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.sp_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.sp_powerpc64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.fbp_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.fbp_powerpc64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.ra_reg_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.ra_reg_powerpc64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_pc_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_pc_powerpc64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_sp_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_sp_powerpc64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_fbp_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_fbp_powerpc64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_ra_reg_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_ra_reg_powerpc64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.setup_fbp_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.setup_fbp_powerpc64); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.reg_size_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.reg_size_powerpc64); /* size 0x54 */
	. = ALIGN(0x10); /* align for .text.reg_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.reg_powerpc64); /* size 0x35c */
	. = ALIGN(0x10); /* align for .text.align_sp_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.text.align_sp_x86_64); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.is_callee_saved_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.text.is_callee_saved_x86_64); /* size 0x2c */
	. = ALIGN(0x10); /* align for .text.callee_reg_size_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.text.callee_reg_size_x86_64); /* size 0x54 */
	. = ALIGN(0x10); /* align for .text.regset_default_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_default_x86_64); /* size 0xc */
	. = . + 0x3; /* padding after .text.regset_default_x86_64 */
	. = ALIGN(0x10); /* align for .text.regset_init_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_init_x86_64); /* size 0x38 */
	. = ALIGN(0x10); /* align for .text.regset_free_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_free_x86_64); /* size 0x4 */
	. = . + 0x1; /* padding after .text.regset_free_x86_64 */
	. = ALIGN(0x10); /* align for .text.regset_clone_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_clone_x86_64); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.regset_copyin_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_copyin_x86_64); /* size 0x8 */
	. = . + 0x2; /* padding after .text.regset_copyin_x86_64 */
	. = ALIGN(0x10); /* align for .text.regset_copyout_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_copyout_x86_64); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.pc_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.pc_x86_64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.sp_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.sp_x86_64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.fbp_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.fbp_x86_64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.ra_reg_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.ra_reg_x86_64); /* size 0x2c */
	. = ALIGN(0x10); /* align for .text.set_pc_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_pc_x86_64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_sp_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_sp_x86_64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_fbp_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_fbp_x86_64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_ra_reg_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_ra_reg_x86_64); /* size 0x2c */
	. = ALIGN(0x10); /* align for .text.setup_fbp_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.setup_fbp_x86_64); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.reg_size_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.reg_size_x86_64); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.reg_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.reg_x86_64); /* size 0x1c4 */
	. = ALIGN(0x10); /* align for .text.put_val */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.text.put_val); /* size 0x254 */
	. = ALIGN(0x10); /* align for .text.get_dest_loc */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.text.get_dest_loc); /* size 0xdc */
	. = ALIGN(0x10); /* align for .text.put_val_arch */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.text.put_val_arch); /* size 0x408 */
	. = ALIGN(0x10); /* align for .text.put_val_data */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.text.put_val_data); /* size 0x114 */
	. = ALIGN(0x10); /* align for .text.points_to_stack */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.text.points_to_stack); /* size 0x160 */
	. = ALIGN(0x10); /* align for .text.points_to_data */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.text.points_to_data); /* size 0x190 */
	. = ALIGN(0x10); /* align for .text.set_return_address */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.text.set_return_address); /* size 0x24 */
	. = ALIGN(0x10); /* align for .text.set_return_address_funcentry */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.text.set_return_address_funcentry); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.get_savedfbp_loc */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.text.get_savedfbp_loc); /* size 0x90 */
	. = ALIGN(0x10); /* align for .text.elf_begin */
	"/usr/local/popcorn/aarch64/lib/libelf.a(begin.o)"(.text.elf_begin); /* size 0xad0 */
	. = ALIGN(0x10); /* align for .text._elf_check_type */
	"/usr/local/popcorn/aarch64/lib/libelf.a(begin.o)"(.text._elf_check_type); /* size 0x264 */
	. = . + 0xa; /* padding after .text._elf_check_type */
	. = ALIGN(0x10); /* align for .text.elf_memory */
	"/usr/local/popcorn/aarch64/lib/libelf.a(begin.o)"(.text.elf_memory); /* size 0xa8 */
	. = ALIGN(0x10); /* align for .text.gelf_getclass */
	"/usr/local/popcorn/aarch64/lib/libelf.a(begin.o)"(.text.gelf_getclass); /* size 0x28 */
	. = ALIGN(0x10); /* align for .text.elf_end */
	"/usr/local/popcorn/aarch64/lib/libelf.a(end.o)"(.text.elf_end); /* size 0x198 */
	. = . + 0x24; /* padding after .text.elf_end */
	. = ALIGN(0x10); /* align for .text.elf_getdata */
	"/usr/local/popcorn/aarch64/lib/libelf.a(getdata.o)"(.text.elf_getdata); /* size 0x280 */
	. = ALIGN(0x10); /* align for .text.elf_getident */
	"/usr/local/popcorn/aarch64/lib/libelf.a(getident.o)"(.text.elf_getident); /* size 0x7c */
	. = ALIGN(0x10); /* align for .text.elf_nextscn */
	"/usr/local/popcorn/aarch64/lib/libelf.a(nextscn.o)"(.text.elf_nextscn); /* size 0xb4 */
	. = ALIGN(0x10); /* align for .text.elf_strptr */
	"/usr/local/popcorn/aarch64/lib/libelf.a(strptr.o)"(.text.elf_strptr); /* size 0x1b0 */
	. = ALIGN(0x10); /* align for .text.elf_version */
	"/usr/local/popcorn/aarch64/lib/libelf.a(version.o)"(.text.elf_version); /* size 0x80 */
	. = ALIGN(0x10); /* align for .text._elf_getehdr */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.getehdr.o)"(.text._elf_getehdr); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.elf32_getehdr */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.getehdr.o)"(.text.elf32_getehdr); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.elf64_getehdr */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.getehdr.o)"(.text.elf64_getehdr); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text._elf32_xltsize */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text._elf32_xltsize); /* size 0x98 */
	. = ALIGN(0x10); /* align for .text.elf32_xlatetom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.elf32_xlatetom); /* size 0x158 */
	. = ALIGN(0x10); /* align for .text.elf32_xlatetof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.elf32_xlatetof); /* size 0x158 */
	. = ALIGN(0x10); /* align for .text.byte_copy */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.byte_copy); /* size 0x184 */
	. = ALIGN(0x10); /* align for .text.addr_32L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.addr_32L__tom); /* size 0x4c */
	. = . + 0x157; /* padding after .text.addr_32L__tom */
	. = ALIGN(0x10); /* align for .text.addr_32L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.addr_32L__tof); /* size 0x4c */
	. = . + 0x55; /* padding after .text.addr_32L__tof */
	. = ALIGN(0x10); /* align for .text.dyn_32L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.dyn_32L11_tom); /* size 0x74 */
	. = . + 0x3; /* padding after .text.dyn_32L11_tom */
	. = ALIGN(0x10); /* align for .text.dyn_32L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.dyn_32L11_tof); /* size 0x74 */
	. = ALIGN(0x10); /* align for .text.ehdr_32L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.ehdr_32L11_tom); /* size 0x1ac */
	. = ALIGN(0x10); /* align for .text.ehdr_32L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.ehdr_32L11_tof); /* size 0x1ac */
	. = ALIGN(0x10); /* align for .text.half_32L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.half_32L__tom); /* size 0x10c */
	. = . + 0xa8; /* padding after .text.half_32L__tom */
	. = ALIGN(0x10); /* align for .text.half_32L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.half_32L__tof); /* size 0x138 */
	. = . + 0x81; /* padding after .text.half_32L__tof */
	. = ALIGN(0x10); /* align for .text.off_32L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.off_32L__tom); /* size 0x4c */
	. = . + 0x157; /* padding after .text.off_32L__tom */
	. = ALIGN(0x10); /* align for .text.off_32L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.off_32L__tof); /* size 0x4c */
	. = . + 0x55; /* padding after .text.off_32L__tof */
	. = ALIGN(0x10); /* align for .text.phdr_32L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.phdr_32L11_tom); /* size 0x14c */
	. = ALIGN(0x10); /* align for .text.phdr_32L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.phdr_32L11_tof); /* size 0x14c */
	. = ALIGN(0x10); /* align for .text.rela_32L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.rela_32L11_tom); /* size 0xb0 */
	. = . + 0xd; /* padding after .text.rela_32L11_tom */
	. = ALIGN(0x10); /* align for .text.rela_32L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.rela_32L11_tof); /* size 0xb0 */
	. = ALIGN(0x10); /* align for .text.rel_32L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.rel_32L11_tom); /* size 0x74 */
	. = . + 0x3; /* padding after .text.rel_32L11_tom */
	. = ALIGN(0x10); /* align for .text.rel_32L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.rel_32L11_tof); /* size 0x74 */
	. = ALIGN(0x10); /* align for .text.shdr_32L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.shdr_32L11_tom); /* size 0x1ac */
	. = . + 0x3; /* padding after .text.shdr_32L11_tom */
	. = ALIGN(0x10); /* align for .text.shdr_32L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.shdr_32L11_tof); /* size 0x1ac */
	. = ALIGN(0x10); /* align for .text.sword_32L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.sword_32L__tom); /* size 0x4c */
	. = . + 0x157; /* padding after .text.sword_32L__tom */
	. = ALIGN(0x10); /* align for .text.sword_32L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.sword_32L__tof); /* size 0x4c */
	. = . + 0x55; /* padding after .text.sword_32L__tof */
	. = ALIGN(0x10); /* align for .text.sym_32L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.sym_32L11_tom); /* size 0xb8 */
	. = . + 0x2; /* padding after .text.sym_32L11_tom */
	. = ALIGN(0x10); /* align for .text.sym_32L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.sym_32L11_tof); /* size 0xb8 */
	. = ALIGN(0x10); /* align for .text.word_32L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.word_32L__tom); /* size 0x4c */
	. = . + 0x157; /* padding after .text.word_32L__tom */
	. = ALIGN(0x10); /* align for .text.word_32L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.word_32L__tof); /* size 0x4c */
	. = . + 0x55; /* padding after .text.word_32L__tof */
	. = ALIGN(0x10); /* align for .text.addr_32M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.addr_32M__tom); /* size 0x48 */
	. = . + 0x14b; /* padding after .text.addr_32M__tom */
	. = ALIGN(0x10); /* align for .text.addr_32M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.addr_32M__tof); /* size 0x48 */
	. = . + 0x49; /* padding after .text.addr_32M__tof */
	. = ALIGN(0x10); /* align for .text.dyn_32M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.dyn_32M11_tom); /* size 0x70 */
	. = . + 0x7; /* padding after .text.dyn_32M11_tom */
	. = ALIGN(0x10); /* align for .text.dyn_32M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.dyn_32M11_tof); /* size 0x70 */
	. = ALIGN(0x10); /* align for .text.ehdr_32M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.ehdr_32M11_tom); /* size 0x1ac */
	. = ALIGN(0x10); /* align for .text.ehdr_32M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.ehdr_32M11_tof); /* size 0x1ac */
	. = ALIGN(0x10); /* align for .text.half_32M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.half_32M__tom); /* size 0x108 */
	. = . + 0xac; /* padding after .text.half_32M__tom */
	. = ALIGN(0x10); /* align for .text.half_32M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.half_32M__tof); /* size 0x134 */
	. = . + 0x85; /* padding after .text.half_32M__tof */
	. = ALIGN(0x10); /* align for .text.off_32M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.off_32M__tom); /* size 0x48 */
	. = . + 0x14b; /* padding after .text.off_32M__tom */
	. = ALIGN(0x10); /* align for .text.off_32M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.off_32M__tof); /* size 0x48 */
	. = . + 0x49; /* padding after .text.off_32M__tof */
	. = ALIGN(0x10); /* align for .text.phdr_32M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.phdr_32M11_tom); /* size 0x148 */
	. = ALIGN(0x10); /* align for .text.phdr_32M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.phdr_32M11_tof); /* size 0x148 */
	. = ALIGN(0x10); /* align for .text.rela_32M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.rela_32M11_tom); /* size 0xac */
	. = . + 0x1; /* padding after .text.rela_32M11_tom */
	. = ALIGN(0x10); /* align for .text.rela_32M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.rela_32M11_tof); /* size 0xac */
	. = ALIGN(0x10); /* align for .text.rel_32M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.rel_32M11_tom); /* size 0x70 */
	. = . + 0x7; /* padding after .text.rel_32M11_tom */
	. = ALIGN(0x10); /* align for .text.rel_32M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.rel_32M11_tof); /* size 0x70 */
	. = ALIGN(0x10); /* align for .text.shdr_32M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.shdr_32M11_tom); /* size 0x1a8 */
	. = ALIGN(0x10); /* align for .text.shdr_32M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.shdr_32M11_tof); /* size 0x1a8 */
	. = ALIGN(0x10); /* align for .text.sword_32M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.sword_32M__tom); /* size 0x48 */
	. = . + 0x14b; /* padding after .text.sword_32M__tom */
	. = ALIGN(0x10); /* align for .text.sword_32M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.sword_32M__tof); /* size 0x48 */
	. = . + 0x49; /* padding after .text.sword_32M__tof */
	. = ALIGN(0x10); /* align for .text.sym_32M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.sym_32M11_tom); /* size 0xb4 */
	. = . + 0x6; /* padding after .text.sym_32M11_tom */
	. = ALIGN(0x10); /* align for .text.sym_32M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.sym_32M11_tof); /* size 0xb4 */
	. = ALIGN(0x10); /* align for .text.word_32M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.word_32M__tom); /* size 0x48 */
	. = . + 0x14b; /* padding after .text.word_32M__tom */
	. = ALIGN(0x10); /* align for .text.word_32M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.word_32M__tof); /* size 0x48 */
	. = . + 0x49; /* padding after .text.word_32M__tof */
	. = ALIGN(0x10); /* align for .text._elf_scn_type */
	"/usr/local/popcorn/aarch64/lib/libelf.a(cook.o)"(.text._elf_scn_type); /* size 0xac */
	. = ALIGN(0x10); /* align for .text._elf_xlatetom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(cook.o)"(.text._elf_xlatetom); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text._elf_cook */
	"/usr/local/popcorn/aarch64/lib/libelf.a(cook.o)"(.text._elf_cook); /* size 0x75c */
	. = . + 0xf5; /* padding after .text._elf_cook */
	. = ALIGN(0x10); /* align for .text._elf_item */
	"/usr/local/popcorn/aarch64/lib/libelf.a(cook.o)"(.text._elf_item); /* size 0x1a0 */
	. = ALIGN(0x10); /* align for .text._elf_read */
	"/usr/local/popcorn/aarch64/lib/libelf.a(input.o)"(.text._elf_read); /* size 0x140 */
	. = ALIGN(0x10); /* align for .text._elf_mmap */
	"/usr/local/popcorn/aarch64/lib/libelf.a(input.o)"(.text._elf_mmap); /* size 0x8 */
	. = . + 0x3c; /* padding after .text._elf_mmap */
	. = ALIGN(0x10); /* align for .text.elf_getphdrnum */
	"/usr/local/popcorn/aarch64/lib/libelf.a(x.elfext.o)"(.text.elf_getphdrnum); /* size 0x80 */
	. = ALIGN(0x10); /* align for .text.elf_getshdrnum */
	"/usr/local/popcorn/aarch64/lib/libelf.a(x.elfext.o)"(.text.elf_getshdrnum); /* size 0x94 */
	. = ALIGN(0x10); /* align for .text.elf_getshdrstrndx */
	"/usr/local/popcorn/aarch64/lib/libelf.a(x.elfext.o)"(.text.elf_getshdrstrndx); /* size 0xf8 */
	. = ALIGN(0x10); /* align for .text.elf_getphnum */
	"/usr/local/popcorn/aarch64/lib/libelf.a(x.elfext.o)"(.text.elf_getphnum); /* size 0x78 */
	. = ALIGN(0x10); /* align for .text.elf_getshnum */
	"/usr/local/popcorn/aarch64/lib/libelf.a(x.elfext.o)"(.text.elf_getshnum); /* size 0x8c */
	. = ALIGN(0x10); /* align for .text.elf_getshstrndx */
	"/usr/local/popcorn/aarch64/lib/libelf.a(x.elfext.o)"(.text.elf_getshstrndx); /* size 0x104 */
	. = ALIGN(0x10); /* align for .text.elfx_update_shstrndx */
	"/usr/local/popcorn/aarch64/lib/libelf.a(x.elfext.o)"(.text.elfx_update_shstrndx); /* size 0xf4 */
	. = ALIGN(0x10); /* align for .text._elf64_xltsize */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text._elf64_xltsize); /* size 0x98 */
	. = ALIGN(0x10); /* align for .text.elf64_xlatetom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.elf64_xlatetom); /* size 0x158 */
	. = ALIGN(0x10); /* align for .text.elf64_xlatetof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.elf64_xlatetof); /* size 0x158 */
	. = ALIGN(0x10); /* align for .text.gelf_xlatetom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.gelf_xlatetom); /* size 0x1b4 */
	. = ALIGN(0x10); /* align for .text.gelf_xlatetof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.gelf_xlatetof); /* size 0x1b4 */
	. = ALIGN(0x10); /* align for .text.byte_copy */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.byte_copy); /* size 0x184 */
	. = ALIGN(0x10); /* align for .text.addr_64L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.addr_64L__tom); /* size 0x54 */
	. = . + 0x8; /* padding after .text.addr_64L__tom */
	. = ALIGN(0x10); /* align for .text.addr_64L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.addr_64L__tof); /* size 0x54 */
	. = . + 0x7; /* padding after .text.addr_64L__tof */
	. = ALIGN(0x10); /* align for .text.dyn_64L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.dyn_64L11_tom); /* size 0x64 */
	. = . + 0x4; /* padding after .text.dyn_64L11_tom */
	. = ALIGN(0x10); /* align for .text.dyn_64L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.dyn_64L11_tof); /* size 0x64 */
	. = . + 0x4; /* padding after .text.dyn_64L11_tof */
	. = ALIGN(0x10); /* align for .text.ehdr_64L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.ehdr_64L11_tom); /* size 0x144 */
	. = . + 0x5e; /* padding after .text.ehdr_64L11_tom */
	. = ALIGN(0x10); /* align for .text.ehdr_64L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.ehdr_64L11_tof); /* size 0x144 */
	. = . + 0x3e; /* padding after .text.ehdr_64L11_tof */
	. = ALIGN(0x10); /* align for .text.half_64L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.half_64L__tom); /* size 0x10c */
	. = . + 0xa8; /* padding after .text.half_64L__tom */
	. = ALIGN(0x10); /* align for .text.half_64L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.half_64L__tof); /* size 0x138 */
	. = . + 0x81; /* padding after .text.half_64L__tof */
	. = ALIGN(0x10); /* align for .text.off_64L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.off_64L__tom); /* size 0x54 */
	. = . + 0x8; /* padding after .text.off_64L__tom */
	. = ALIGN(0x10); /* align for .text.off_64L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.off_64L__tof); /* size 0x54 */
	. = . + 0x7; /* padding after .text.off_64L__tof */
	. = ALIGN(0x10); /* align for .text.phdr_64L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.phdr_64L11_tom); /* size 0x114 */
	. = . + 0xa; /* padding after .text.phdr_64L11_tom */
	. = ALIGN(0x10); /* align for .text.phdr_64L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.phdr_64L11_tof); /* size 0x114 */
	. = . + 0x2; /* padding after .text.phdr_64L11_tof */
	. = ALIGN(0x10); /* align for .text.rela_64L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.rela_64L11_tom); /* size 0x88 */
	. = . + 0x1; /* padding after .text.rela_64L11_tom */
	. = ALIGN(0x10); /* align for .text.rela_64L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.rela_64L11_tof); /* size 0x88 */
	. = . + 0x1; /* padding after .text.rela_64L11_tof */
	. = ALIGN(0x10); /* align for .text.rel_64L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.rel_64L11_tom); /* size 0x64 */
	. = . + 0x4; /* padding after .text.rel_64L11_tom */
	. = ALIGN(0x10); /* align for .text.rel_64L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.rel_64L11_tof); /* size 0x64 */
	. = . + 0x4; /* padding after .text.rel_64L11_tof */
	. = ALIGN(0x10); /* align for .text.shdr_64L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.shdr_64L11_tom); /* size 0x13c */
	. = . + 0x1a; /* padding after .text.shdr_64L11_tom */
	. = ALIGN(0x10); /* align for .text.shdr_64L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.shdr_64L11_tof); /* size 0x13c */
	. = . + 0xa; /* padding after .text.shdr_64L11_tof */
	. = ALIGN(0x10); /* align for .text.sword_64L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sword_64L__tom); /* size 0x4c */
	. = . + 0x157; /* padding after .text.sword_64L__tom */
	. = ALIGN(0x10); /* align for .text.sword_64L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sword_64L__tof); /* size 0x4c */
	. = . + 0x55; /* padding after .text.sword_64L__tof */
	. = ALIGN(0x10); /* align for .text.sym_64L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sym_64L11_tom); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.sym_64L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sym_64L11_tof); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.word_64L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.word_64L__tom); /* size 0x4c */
	. = . + 0x157; /* padding after .text.word_64L__tom */
	. = ALIGN(0x10); /* align for .text.word_64L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.word_64L__tof); /* size 0x4c */
	. = . + 0x55; /* padding after .text.word_64L__tof */
	. = ALIGN(0x10); /* align for .text.sxword_64L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sxword_64L__tom); /* size 0x54 */
	. = . + 0x8; /* padding after .text.sxword_64L__tom */
	. = ALIGN(0x10); /* align for .text.sxword_64L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sxword_64L__tof); /* size 0x54 */
	. = . + 0x7; /* padding after .text.sxword_64L__tof */
	. = ALIGN(0x10); /* align for .text.xword_64L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.xword_64L__tom); /* size 0x54 */
	. = . + 0x8; /* padding after .text.xword_64L__tom */
	. = ALIGN(0x10); /* align for .text.xword_64L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.xword_64L__tof); /* size 0x54 */
	. = . + 0x7; /* padding after .text.xword_64L__tof */
	. = ALIGN(0x10); /* align for .text.addr_64M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.addr_64M__tom); /* size 0x54 */
	. = . + 0x8; /* padding after .text.addr_64M__tom */
	. = ALIGN(0x10); /* align for .text.addr_64M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.addr_64M__tof); /* size 0x54 */
	. = . + 0x7; /* padding after .text.addr_64M__tof */
	. = ALIGN(0x10); /* align for .text.dyn_64M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.dyn_64M11_tom); /* size 0x64 */
	. = . + 0x4; /* padding after .text.dyn_64M11_tom */
	. = ALIGN(0x10); /* align for .text.dyn_64M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.dyn_64M11_tof); /* size 0x64 */
	. = . + 0x4; /* padding after .text.dyn_64M11_tof */
	. = ALIGN(0x10); /* align for .text.ehdr_64M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.ehdr_64M11_tom); /* size 0x144 */
	. = . + 0x5e; /* padding after .text.ehdr_64M11_tom */
	. = ALIGN(0x10); /* align for .text.ehdr_64M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.ehdr_64M11_tof); /* size 0x144 */
	. = . + 0x3e; /* padding after .text.ehdr_64M11_tof */
	. = ALIGN(0x10); /* align for .text.half_64M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.half_64M__tom); /* size 0x108 */
	. = . + 0xac; /* padding after .text.half_64M__tom */
	. = ALIGN(0x10); /* align for .text.half_64M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.half_64M__tof); /* size 0x134 */
	. = . + 0x85; /* padding after .text.half_64M__tof */
	. = ALIGN(0x10); /* align for .text.off_64M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.off_64M__tom); /* size 0x54 */
	. = . + 0x8; /* padding after .text.off_64M__tom */
	. = ALIGN(0x10); /* align for .text.off_64M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.off_64M__tof); /* size 0x54 */
	. = . + 0x7; /* padding after .text.off_64M__tof */
	. = ALIGN(0x10); /* align for .text.phdr_64M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.phdr_64M11_tom); /* size 0xfc */
	. = ALIGN(0x10); /* align for .text.phdr_64M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.phdr_64M11_tof); /* size 0xfc */
	. = ALIGN(0x10); /* align for .text.rela_64M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.rela_64M11_tom); /* size 0x88 */
	. = . + 0x1; /* padding after .text.rela_64M11_tom */
	. = ALIGN(0x10); /* align for .text.rela_64M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.rela_64M11_tof); /* size 0x88 */
	. = . + 0x1; /* padding after .text.rela_64M11_tof */
	. = ALIGN(0x10); /* align for .text.rel_64M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.rel_64M11_tom); /* size 0x64 */
	. = . + 0x4; /* padding after .text.rel_64M11_tom */
	. = ALIGN(0x10); /* align for .text.rel_64M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.rel_64M11_tof); /* size 0x64 */
	. = . + 0x4; /* padding after .text.rel_64M11_tof */
	. = ALIGN(0x10); /* align for .text.shdr_64M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.shdr_64M11_tom); /* size 0x124 */
	. = . + 0x8; /* padding after .text.shdr_64M11_tom */
	. = ALIGN(0x10); /* align for .text.shdr_64M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.shdr_64M11_tof); /* size 0x124 */
	. = ALIGN(0x10); /* align for .text.sword_64M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sword_64M__tom); /* size 0x48 */
	. = . + 0x14b; /* padding after .text.sword_64M__tom */
	. = ALIGN(0x10); /* align for .text.sword_64M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sword_64M__tof); /* size 0x48 */
	. = . + 0x49; /* padding after .text.sword_64M__tof */
	. = ALIGN(0x10); /* align for .text.sym_64M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sym_64M11_tom); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.sym_64M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sym_64M11_tof); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.word_64M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.word_64M__tom); /* size 0x48 */
	. = . + 0x14b; /* padding after .text.word_64M__tom */
	. = ALIGN(0x10); /* align for .text.word_64M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.word_64M__tof); /* size 0x48 */
	. = . + 0x49; /* padding after .text.word_64M__tof */
	. = ALIGN(0x10); /* align for .text.sxword_64M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sxword_64M__tom); /* size 0x54 */
	. = . + 0x8; /* padding after .text.sxword_64M__tom */
	. = ALIGN(0x10); /* align for .text.sxword_64M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sxword_64M__tof); /* size 0x54 */
	. = . + 0x7; /* padding after .text.sxword_64M__tof */
	. = ALIGN(0x10); /* align for .text.xword_64M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.xword_64M__tom); /* size 0x54 */
	. = . + 0x8; /* padding after .text.xword_64M__tom */
	. = ALIGN(0x10); /* align for .text.xword_64M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.xword_64M__tof); /* size 0x54 */
	. = . + 0x7; /* padding after .text.xword_64M__tof */
	. = ALIGN(0x10); /* align for .text.gelf_getshdr */
	"/usr/local/popcorn/aarch64/lib/libelf.a(gelfshdr.o)"(.text.gelf_getshdr); /* size 0x118 */
	. = ALIGN(0x10); /* align for .text.gelf_update_shdr */
	"/usr/local/popcorn/aarch64/lib/libelf.a(gelfshdr.o)"(.text.gelf_update_shdr); /* size 0x11c */
	. = . + 0x1d; /* padding after .text.gelf_update_shdr */
	. = ALIGN(0x10); /* align for .text._elf_load_u64L */
	"/usr/local/popcorn/aarch64/lib/libelf.a(swap64.o)"(.text._elf_load_u64L); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text._elf_load_u64M */
	"/usr/local/popcorn/aarch64/lib/libelf.a(swap64.o)"(.text._elf_load_u64M); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text._elf_load_i64L */
	"/usr/local/popcorn/aarch64/lib/libelf.a(swap64.o)"(.text._elf_load_i64L); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text._elf_load_i64M */
	"/usr/local/popcorn/aarch64/lib/libelf.a(swap64.o)"(.text._elf_load_i64M); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text._elf_store_u64L */
	"/usr/local/popcorn/aarch64/lib/libelf.a(swap64.o)"(.text._elf_store_u64L); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text._elf_store_u64M */
	"/usr/local/popcorn/aarch64/lib/libelf.a(swap64.o)"(.text._elf_store_u64M); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text._elf_store_i64L */
	"/usr/local/popcorn/aarch64/lib/libelf.a(swap64.o)"(.text._elf_store_i64L); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text._elf_store_i64M */
	"/usr/local/popcorn/aarch64/lib/libelf.a(swap64.o)"(.text._elf_store_i64M); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text._elf_verdef_32L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tof.o)"(.text._elf_verdef_32L11_tof); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verdef_32L11_tof */
	. = ALIGN(0x10); /* align for .text.xlt_verdef */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tof.o)"(.text.xlt_verdef); /* size 0x2a0 */
	. = . + 0x5d; /* padding after .text.xlt_verdef */
	. = ALIGN(0x10); /* align for .text._elf_verdef_32M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tof.o)"(.text._elf_verdef_32M11_tof); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verdef_32M11_tof */
	. = ALIGN(0x10); /* align for .text._elf_verneed_32L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tof.o)"(.text._elf_verneed_32L11_tof); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verneed_32L11_tof */
	. = ALIGN(0x10); /* align for .text.xlt_verneed */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tof.o)"(.text.xlt_verneed); /* size 0x2e0 */
	. = . + 0x71; /* padding after .text.xlt_verneed */
	. = ALIGN(0x10); /* align for .text._elf_verneed_32M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tof.o)"(.text._elf_verneed_32M11_tof); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verneed_32M11_tof */
	. = ALIGN(0x10); /* align for .text._elf_verdef_32L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tom.o)"(.text._elf_verdef_32L11_tom); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verdef_32L11_tom */
	. = ALIGN(0x10); /* align for .text.xlt_verdef */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tom.o)"(.text.xlt_verdef); /* size 0x2d4 */
	. = . + 0x14b; /* padding after .text.xlt_verdef */
	. = ALIGN(0x10); /* align for .text._elf_verdef_32M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tom.o)"(.text._elf_verdef_32M11_tom); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verdef_32M11_tom */
	. = ALIGN(0x10); /* align for .text._elf_verneed_32L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tom.o)"(.text._elf_verneed_32L11_tom); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verneed_32L11_tom */
	. = ALIGN(0x10); /* align for .text.xlt_verneed */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tom.o)"(.text.xlt_verneed); /* size 0x2d8 */
	. = . + 0xc9; /* padding after .text.xlt_verneed */
	. = ALIGN(0x10); /* align for .text._elf_verneed_32M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tom.o)"(.text._elf_verneed_32M11_tom); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verneed_32M11_tom */
	. = ALIGN(0x10); /* align for .text._elf_verdef_64L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tof.o)"(.text._elf_verdef_64L11_tof); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verdef_64L11_tof */
	. = ALIGN(0x10); /* align for .text.xlt_verdef */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tof.o)"(.text.xlt_verdef); /* size 0x2a0 */
	. = . + 0x5d; /* padding after .text.xlt_verdef */
	. = ALIGN(0x10); /* align for .text._elf_verdef_64M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tof.o)"(.text._elf_verdef_64M11_tof); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verdef_64M11_tof */
	. = ALIGN(0x10); /* align for .text._elf_verneed_64L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tof.o)"(.text._elf_verneed_64L11_tof); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verneed_64L11_tof */
	. = ALIGN(0x10); /* align for .text.xlt_verneed */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tof.o)"(.text.xlt_verneed); /* size 0x2e0 */
	. = . + 0x71; /* padding after .text.xlt_verneed */
	. = ALIGN(0x10); /* align for .text._elf_verneed_64M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tof.o)"(.text._elf_verneed_64M11_tof); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verneed_64M11_tof */
	. = ALIGN(0x10); /* align for .text._elf_verdef_64L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tom.o)"(.text._elf_verdef_64L11_tom); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verdef_64L11_tom */
	. = ALIGN(0x10); /* align for .text.xlt_verdef */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tom.o)"(.text.xlt_verdef); /* size 0x2d4 */
	. = . + 0x14b; /* padding after .text.xlt_verdef */
	. = ALIGN(0x10); /* align for .text._elf_verdef_64M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tom.o)"(.text._elf_verdef_64M11_tom); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verdef_64M11_tom */
	. = ALIGN(0x10); /* align for .text._elf_verneed_64L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tom.o)"(.text._elf_verneed_64L11_tom); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verneed_64L11_tom */
	. = ALIGN(0x10); /* align for .text.xlt_verneed */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tom.o)"(.text.xlt_verneed); /* size 0x2d8 */
	. = . + 0xc9; /* padding after .text.xlt_verneed */
	. = ALIGN(0x10); /* align for .text._elf_verneed_64M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tom.o)"(.text._elf_verneed_64M11_tom); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verneed_64M11_tom */
	. = ALIGN(0x10); /* align for .text.elf_getscn */
	"/usr/local/popcorn/aarch64/lib/libelf.a(getscn.o)"(.text.elf_getscn); /* size 0x90 */
	. = ALIGN(0x10); /* align for .text._elf_update_shnum */
	"/usr/local/popcorn/aarch64/lib/libelf.a(newscn.o)"(.text._elf_update_shnum); /* size 0x78 */
	. = ALIGN(0x10); /* align for .text._elf_first_scn */
	"/usr/local/popcorn/aarch64/lib/libelf.a(newscn.o)"(.text._elf_first_scn); /* size 0xf4 */
	. = ALIGN(0x10); /* align for .text.elf_newscn */
	"/usr/local/popcorn/aarch64/lib/libelf.a(newscn.o)"(.text.elf_newscn); /* size 0x250 */
	. = ALIGN(0x10); /* align for .text.elf32_fsize */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.fsize.o)"(.text.elf32_fsize); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.elf64_fsize */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.fsize.o)"(.text.elf64_fsize); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.gelf_fsize */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.fsize.o)"(.text.gelf_fsize); /* size 0xa8 */
	. = ALIGN(0x10); /* align for .text.gelf_msize */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.fsize.o)"(.text.gelf_msize); /* size 0xb4 */
	. = ALIGN(0x4); /* align for .text.__crash_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libc.a(arch_crash.o)"(.text.__crash_aarch64); /* size 0x30 */
	. = ALIGN(0x4); /* align for .text.__crash_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libc.a(arch_crash.o)"(.text.__crash_powerpc64); /* size 0x8 */
	. = ALIGN(0x4); /* align for .text.__crash_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libc.a(arch_crash.o)"(.text.__crash_x86_64); /* size 0x8 */
	. = . + 0x10; /* padding after .text.__crash_x86_64 */
	. = ALIGN(0x4); /* align for .text.__crash */
	"/usr/local/popcorn/aarch64/lib/libc.a(arch_crash.o)"(.text.__crash); /* size 0x30 */
	. = ALIGN(0x4); /* align for .text.getenv */
	"/usr/local/popcorn/aarch64/lib/libc.a(getenv.o)"(.text.getenv); /* size 0x8c */
	. = ALIGN(0x4); /* align for .text.popcorn_getnid */
	"/usr/local/popcorn/aarch64/lib/libc.a(platform.o)"(.text.popcorn_getnid); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.popcorn_getthreadinfo */
	"/usr/local/popcorn/aarch64/lib/libc.a(platform.o)"(.text.popcorn_getthreadinfo); /* size 0x1c */
	. = ALIGN(0x4); /* align for .text.popcorn_getnodeinfo */
	"/usr/local/popcorn/aarch64/lib/libc.a(platform.o)"(.text.popcorn_getnodeinfo); /* size 0x8c */
	. = ALIGN(0x4); /* align for .text.__assert_fail */
	"/usr/local/popcorn/aarch64/lib/libc.a(assert.o)"(.text.__assert_fail); /* size 0x4c */
	. = ALIGN(0x4); /* align for .text.open */
	"/usr/local/popcorn/aarch64/lib/libc.a(open.o)"(.text.open); /* size 0x10c */
	. = . + 0x1a; /* padding after .text.open */
	. = ALIGN(0x10); /* align for .text.calloc */
	"/usr/local/popcorn/aarch64/lib/libc.a(calloc.o)"(.text.calloc); /* size 0x48 */
	. = ALIGN(0x10); /* align for .text.popcorn_calloc */
	"/usr/local/popcorn/aarch64/lib/libc.a(calloc.o)"(.text.popcorn_calloc); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.popcorn_calloc_cur */
	"/usr/local/popcorn/aarch64/lib/libc.a(calloc.o)"(.text.popcorn_calloc_cur); /* size 0x5c */
	. = ALIGN(0x10); /* align for .text.__simple_malloc */
	"/usr/local/popcorn/aarch64/lib/libc.a(lite_malloc.o)"(.text.__simple_malloc); /* size 0x104 */
	. = ALIGN(0x10); /* align for .text.__init_malloc */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.__init_malloc); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.malloc */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.malloc); /* size 0x828 */
	. = ALIGN(0x10); /* align for .text.lock_bin */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.lock_bin); /* size 0xac */
	. = ALIGN(0x10); /* align for .text.unbin */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.unbin); /* size 0xa4 */
	. = ALIGN(0x10); /* align for .text.unlock_bin */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.unlock_bin); /* size 0x6c */
	. = ALIGN(0x10); /* align for .text.__malloc0 */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.__malloc0); /* size 0xc4 */
	. = ALIGN(0x10); /* align for .text.realloc */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.realloc); /* size 0x26c */
	. = ALIGN(0x10); /* align for .text.free */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.free); /* size 0x6b0 */
	. = ALIGN(0x10); /* align for .text.alloc_fwd */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.alloc_fwd); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .text.__init_malloc */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.__init_malloc); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.popcorn_malloc */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.popcorn_malloc); /* size 0xa88 */
	. = ALIGN(0x10); /* align for .text.__popcorn_malloc0 */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.__popcorn_malloc0); /* size 0xc4 */
	. = ALIGN(0x10); /* align for .text.popcorn_malloc_cur */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.popcorn_malloc_cur); /* size 0x28 */
	. = ALIGN(0x10); /* align for .text.popcorn_realloc */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.popcorn_realloc); /* size 0x520 */
	. = ALIGN(0x10); /* align for .text.popcorn_free */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.popcorn_free); /* size 0x9d8 */
	. = ALIGN(0x10); /* align for .text.popcorn_realloc_cur */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.popcorn_realloc_cur); /* size 0x30 */
	. = ALIGN(0x4); /* align for .text.getrlimit */
	"/usr/local/popcorn/aarch64/lib/libc.a(getrlimit.o)"(.text.getrlimit); /* size 0xf8 */
	. = ALIGN(0x4); /* align for .text.syscall */
	"/usr/local/popcorn/aarch64/lib/libc.a(syscall.o)"(.text.syscall); /* size 0x188 */
	. = . + 0x67; /* padding after .text.syscall */
	. = ALIGN(0x4); /* align for .text.__madvise */
	"/usr/local/popcorn/aarch64/lib/libc.a(madvise.o)"(.text.__madvise); /* size 0x20 */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(mremap.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.__mremap */
	"/usr/local/popcorn/aarch64/lib/libc.a(mremap.o)"(.text.__mremap); /* size 0x110 */
	. = . + 0xe; /* padding after .text.__mremap */
	. = ALIGN(0x4); /* align for .text.__get_handler_set */
	"/usr/local/popcorn/aarch64/lib/libc.a(sigaction.o)"(.text.__get_handler_set); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.__libc_sigaction */
	"/usr/local/popcorn/aarch64/lib/libc.a(sigaction.o)"(.text.__libc_sigaction); /* size 0x194 */
	. = ALIGN(0x4); /* align for .text.__sigaction */
	"/usr/local/popcorn/aarch64/lib/libc.a(sigaction.o)"(.text.__sigaction); /* size 0x40 */
	. = ALIGN(0x4); /* align for .text.sigemptyset */
	"/usr/local/popcorn/aarch64/lib/libc.a(sigemptyset.o)"(.text.sigemptyset); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.__libc_current_sigrtmin */
	"/usr/local/popcorn/aarch64/lib/libc.a(sigrtmin.o)"(.text.__libc_current_sigrtmin); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.__restore_rt */
	"/usr/local/popcorn/aarch64/lib/libc.a(restore.o)"(.text.__restore_rt); /* size 0x8 */
	. = . + 0x1; /* padding after .text.__restore_rt */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(fclose.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.fclose */
	"/usr/local/popcorn/aarch64/lib/libc.a(fclose.o)"(.text.fclose); /* size 0xd8 */
	. = ALIGN(0x4); /* align for .text.fflush */
	"/usr/local/popcorn/aarch64/lib/libc.a(fflush.o)"(.text.fflush); /* size 0x154 */
	. = ALIGN(0x4); /* align for .text.fopen */
	"/usr/local/popcorn/aarch64/lib/libc.a(fopen.o)"(.text.fopen); /* size 0xc0 */
	. = ALIGN(0x4); /* align for .text.fprintf */
	"/usr/local/popcorn/aarch64/lib/libc.a(fprintf.o)"(.text.fprintf); /* size 0x74 */
	. = . + 0x23; /* padding after .text.fprintf */
	. = ALIGN(0x4); /* align for .text.fscanf */
	"/usr/local/popcorn/aarch64/lib/libc.a(fscanf.o)"(.text.fscanf); /* size 0x74 */
	. = . + 0x23; /* padding after .text.fscanf */
	. = ALIGN(0x4); /* align for .text.__fseeko_unlocked */
	"/usr/local/popcorn/aarch64/lib/libc.a(fseek.o)"(.text.__fseeko_unlocked); /* size 0xc0 */
	. = ALIGN(0x4); /* align for .text.__fseeko */
	"/usr/local/popcorn/aarch64/lib/libc.a(fseek.o)"(.text.__fseeko); /* size 0x7c */
	. = ALIGN(0x4); /* align for .text.fseek */
	"/usr/local/popcorn/aarch64/lib/libc.a(fseek.o)"(.text.fseek); /* size 0x4 */
	. = . + 0x1; /* padding after .text.fseek */
	. = ALIGN(0x4); /* align for .text.getc */
	"/usr/local/popcorn/aarch64/lib/libc.a(getc.o)"(.text.getc); /* size 0xa0 */
	. = ALIGN(0x4); /* align for .text.getline */
	"/usr/local/popcorn/aarch64/lib/libc.a(getline.o)"(.text.getline); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.snprintf */
	"/usr/local/popcorn/aarch64/lib/libc.a(snprintf.o)"(.text.snprintf); /* size 0x74 */
	. = . + 0x1e; /* padding after .text.snprintf */
	. = ALIGN(0x4); /* align for .text.sscanf */
	"/usr/local/popcorn/aarch64/lib/libc.a(sscanf.o)"(.text.sscanf); /* size 0x74 */
	. = . + 0x23; /* padding after .text.sscanf */
	. = ALIGN(0x4); /* align for .text.vfscanf */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfscanf.o)"(.text.vfscanf); /* size 0xd98 */
	. = ALIGN(0x4); /* align for .text.vsnprintf */
	"/usr/local/popcorn/aarch64/lib/libc.a(vsnprintf.o)"(.text.vsnprintf); /* size 0xd4 */
	. = ALIGN(0x4); /* align for .text.sn_write */
	"/usr/local/popcorn/aarch64/lib/libc.a(vsnprintf.o)"(.text.sn_write); /* size 0xd8 */
	. = ALIGN(0x4); /* align for .text.vsscanf */
	"/usr/local/popcorn/aarch64/lib/libc.a(vsscanf.o)"(.text.vsscanf); /* size 0x80 */
	. = ALIGN(0x4); /* align for .text.do_read */
	"/usr/local/popcorn/aarch64/lib/libc.a(vsscanf.o)"(.text.do_read); /* size 0x4 */
	. = . + 0x1; /* padding after .text.do_read */
	. = ALIGN(0x4); /* align for .text.bsearch */
	"/usr/local/popcorn/aarch64/lib/libc.a(bsearch.o)"(.text.bsearch); /* size 0x84 */
	. = ALIGN(0x4); /* align for .text.qsort */
	"/usr/local/popcorn/aarch64/lib/libc.a(qsort.o)"(.text.qsort); /* size 0x34c */
	. = . + 0x7; /* padding after .text.qsort */
	. = ALIGN(0x4); /* align for .text.sift */
	"/usr/local/popcorn/aarch64/lib/libc.a(qsort.o)"(.text.sift); /* size 0x108 */
	. = ALIGN(0x4); /* align for .text.trinkle */
	"/usr/local/popcorn/aarch64/lib/libc.a(qsort.o)"(.text.trinkle); /* size 0x1dc */
	. = . + 0x59; /* padding after .text.trinkle */
	. = ALIGN(0x4); /* align for .text.cycle */
	"/usr/local/popcorn/aarch64/lib/libc.a(qsort.o)"(.text.cycle); /* size 0xbc */
	. = ALIGN(0x4); /* align for .text.strtoull */
	"/usr/local/popcorn/aarch64/lib/libc.a(strtol.o)"(.text.strtoull); /* size 0x8 */
	. = . + 0x4; /* padding after .text.strtoull */
	. = ALIGN(0x4); /* align for .text.strtox */
	"/usr/local/popcorn/aarch64/lib/libc.a(strtol.o)"(.text.strtox); /* size 0xb4 */
	. = ALIGN(0x4); /* align for .text.strtoll */
	"/usr/local/popcorn/aarch64/lib/libc.a(strtol.o)"(.text.strtoll); /* size 0x8 */
	. = . + 0x7; /* padding after .text.strtoll */
	. = ALIGN(0x4); /* align for .text.strtoul */
	"/usr/local/popcorn/aarch64/lib/libc.a(strtol.o)"(.text.strtoul); /* size 0x8 */
	. = . + 0x4; /* padding after .text.strtoul */
	. = ALIGN(0x4); /* align for .text.strtol */
	"/usr/local/popcorn/aarch64/lib/libc.a(strtol.o)"(.text.strtol); /* size 0x8 */
	. = . + 0x7; /* padding after .text.strtol */
	. = ALIGN(0x4); /* align for .text.strtoimax */
	"/usr/local/popcorn/aarch64/lib/libc.a(strtol.o)"(.text.strtoimax); /* size 0x8 */
	. = . + 0x7; /* padding after .text.strtoimax */
	. = ALIGN(0x4); /* align for .text.strtoumax */
	"/usr/local/popcorn/aarch64/lib/libc.a(strtol.o)"(.text.strtoumax); /* size 0x8 */
	. = . + 0x4; /* padding after .text.strtoumax */
	. = ALIGN(0x10); /* align for .text.strchr */
	"/usr/local/popcorn/aarch64/lib/libc.a(strchr.o)"(.text.strchr); /* size 0x2c */
	. = ALIGN(0x10); /* align for .text.__strchrnul */
	"/usr/local/popcorn/aarch64/lib/libc.a(strchrnul.o)"(.text.__strchrnul); /* size 0xac */
	. = . + 0x3c; /* padding after .text.__strchrnul */
	. = ALIGN(0x10); /* align for .text.strcmp */
	"/usr/local/popcorn/aarch64/lib/libc.a(strcmp.o)"(.text.strcmp); /* size 0x28 */
	. = . + 0x1e; /* padding after .text.strcmp */
	. = ALIGN(0x10); /* align for .text.strncmp */
	"/usr/local/popcorn/aarch64/lib/libc.a(strncmp.o)"(.text.strncmp); /* size 0x50 */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getdetachstate */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_attr_getdetachstate); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getguardsize */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_attr_getguardsize); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getinheritsched */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_attr_getinheritsched); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getschedparam */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_attr_getschedparam); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getschedpolicy */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_attr_getschedpolicy); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getscope */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_attr_getscope); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getstack */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_attr_getstack); /* size 0x2c */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getstacksize */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_attr_getstacksize); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.pthread_barrierattr_getpshared */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_barrierattr_getpshared); /* size 0x18 */
	. = ALIGN(0x4); /* align for .text.pthread_condattr_getclock */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_condattr_getclock); /* size 0x14 */
	. = ALIGN(0x4); /* align for .text.pthread_condattr_getpshared */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_condattr_getpshared); /* size 0x14 */
	. = ALIGN(0x4); /* align for .text.pthread_mutexattr_getprotocol */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_mutexattr_getprotocol); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.pthread_mutexattr_getpshared */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_mutexattr_getpshared); /* size 0x14 */
	. = ALIGN(0x4); /* align for .text.pthread_mutexattr_getrobust */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_mutexattr_getrobust); /* size 0x14 */
	. = ALIGN(0x4); /* align for .text.pthread_mutexattr_gettype */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_mutexattr_gettype); /* size 0x14 */
	. = ALIGN(0x4); /* align for .text.pthread_rwlockattr_getpshared */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_rwlockattr_getpshared); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.pthread_getattr_np */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_getattr_np.o)"(.text.pthread_getattr_np); /* size 0xec */
	. = ALIGN(0x4); /* align for .text.pthread_set_migrate_args */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_migrate.o)"(.text.pthread_set_migrate_args); /* size 0xc */
	. = . + 0x5; /* padding after .text.pthread_set_migrate_args */
	. = ALIGN(0x4); /* align for .text.pthread_get_migrate_args */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_migrate.o)"(.text.pthread_get_migrate_args); /* size 0xc */
	. = . + 0x5; /* padding after .text.pthread_get_migrate_args */
	. = ALIGN(0x4); /* align for .text.__pthread_self_internal */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_self.o)"(.text.__pthread_self_internal); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(close.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.close */
	"/usr/local/popcorn/aarch64/lib/libc.a(close.o)"(.text.close); /* size 0x44 */
	. = ALIGN(0x4); /* align for .text.lseek */
	"/usr/local/popcorn/aarch64/lib/libc.a(lseek.o)"(.text.lseek); /* size 0x14 */
	. = . + 0x1; /* padding after .text.lseek */
	. = ALIGN(0x4); /* align for .text.read */
	"/usr/local/popcorn/aarch64/lib/libc.a(read.o)"(.text.read); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.abort */
	"/usr/local/popcorn/aarch64/lib/libc.a(abort.o)"(.text.abort); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.__floatscan */
	"/usr/local/popcorn/aarch64/lib/libc.a(floatscan.o)"(.text.__floatscan); /* size 0x163c */
	. = . + 0xe0; /* padding after .text.__floatscan */
	. = ALIGN(0x10); /* align for .text.scanexp */
	"/usr/local/popcorn/aarch64/lib/libc.a(floatscan.o)"(.text.scanexp); /* size 0x21c */
	. = ALIGN(0x10); /* align for .text.__intscan */
	"/usr/local/popcorn/aarch64/lib/libc.a(intscan.o)"(.text.__intscan); /* size 0x5c8 */
	. = . + 0x6; /* padding after .text.__intscan */
	. = ALIGN(0x10); /* align for .text.__shlim */
	"/usr/local/popcorn/aarch64/lib/libc.a(shgetc.o)"(.text.__shlim); /* size 0x24 */
	. = . + 0x15; /* padding after .text.__shlim */
	. = ALIGN(0x10); /* align for .text.__shgetc */
	"/usr/local/popcorn/aarch64/lib/libc.a(shgetc.o)"(.text.__shgetc); /* size 0xbc */
	. = ALIGN(0x10); /* align for .text.__expand_heap */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.text.__expand_heap); /* size 0x178 */
	. = ALIGN(0x10); /* align for .text.__expand_heap_node */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.text.__expand_heap_node); /* size 0x238 */
	. = ALIGN(0x10); /* align for .text.popcorn_get_arena */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.text.popcorn_get_arena); /* size 0x128 */
	. = ALIGN(0x4); /* align for .text.copysignl */
	"/usr/local/popcorn/aarch64/lib/libc.a(copysignl.o)"(.text.copysignl); /* size 0x2c */
	. = ALIGN(0x4); /* align for .text.scalbn */
	"/usr/local/popcorn/aarch64/lib/libc.a(scalbn.o)"(.text.scalbn); /* size 0x88 */
	. = . + 0x6; /* padding after .text.scalbn */
	. = ALIGN(0x4); /* align for .text.scalbnl */
	"/usr/local/popcorn/aarch64/lib/libc.a(scalbnl.o)"(.text.scalbnl); /* size 0xd4 */
	. = ALIGN(0x4); /* align for .text.fabs */
	"/usr/local/popcorn/aarch64/lib/libc.a(fabs.o)"(.text.fabs); /* size 0x8 */
	. = . + 0xa; /* padding after .text.fabs */
	. = ALIGN(0x4); /* align for .text.fmodl */
	"/usr/local/popcorn/aarch64/lib/libc.a(fmodl.o)"(.text.fmodl); /* size 0x254 */
	. = ALIGN(0x4); /* align for .text.mbrtowc */
	"/usr/local/popcorn/aarch64/lib/libc.a(mbrtowc.o)"(.text.mbrtowc); /* size 0x144 */
	. = ALIGN(0x4); /* align for .text.mbsinit */
	"/usr/local/popcorn/aarch64/lib/libc.a(mbsinit.o)"(.text.mbsinit); /* size 0x1c */
	. = ALIGN(0x4); /* align for .text.raise */
	"/usr/local/popcorn/aarch64/lib/libc.a(raise.o)"(.text.raise); /* size 0x58 */
	. = ALIGN(0x4); /* align for .text.__fdopen */
	"/usr/local/popcorn/aarch64/lib/libc.a(__fdopen.o)"(.text.__fdopen); /* size 0x1b4 */
	. = ALIGN(0x4); /* align for .text.__fmodeflags */
	"/usr/local/popcorn/aarch64/lib/libc.a(__fmodeflags.o)"(.text.__fmodeflags); /* size 0x94 */
	. = ALIGN(0x4); /* align for .text.__stdio_read */
	"/usr/local/popcorn/aarch64/lib/libc.a(__stdio_read.o)"(.text.__stdio_read); /* size 0xe0 */
	. = ALIGN(0x4); /* align for .text.__string_read */
	"/usr/local/popcorn/aarch64/lib/libc.a(__string_read.o)"(.text.__string_read); /* size 0x84 */
	. = ALIGN(0x4); /* align for .text.__uflow */
	"/usr/local/popcorn/aarch64/lib/libc.a(__uflow.o)"(.text.__uflow); /* size 0x54 */
	. = ALIGN(0x4); /* align for .text.getdelim */
	"/usr/local/popcorn/aarch64/lib/libc.a(getdelim.o)"(.text.getdelim); /* size 0x270 */
	. = ALIGN(0x4); /* align for .text.__ofl_add */
	"/usr/local/popcorn/aarch64/lib/libc.a(ofl_add.o)"(.text.__ofl_add); /* size 0x40 */
	. = ALIGN(0x4); /* align for .text.__toread */
	"/usr/local/popcorn/aarch64/lib/libc.a(__toread.o)"(.text.__toread); /* size 0x88 */
	. = ALIGN(0x4); /* align for .text.__toread_needs_stdio_exit */
	"/usr/local/popcorn/aarch64/lib/libc.a(__toread.o)"(.text.__toread_needs_stdio_exit); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__toread_needs_stdio_exit */
	. = . + 0x25; /* padding after .text.memmove */
	. = ALIGN(0x4); /* align for .text.array_copy */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.array_copy); /* size 0x138 */
	. = ALIGN(0x4); /* align for .text.array_copy */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.array_copy); /* size 0x138 */
	. = ALIGN(0x10); /* align for .text.__restore */
	"/usr/local/popcorn/aarch64/lib/libc.a(restore.o)"(.text.__restore); /* size 0x8 */
	*(.text);
}
  
  .fini           :
  {
/*    KEEP (*(SORT_NONE(.fini)))*/
  } =0
  PROVIDE (__etext = .);
  PROVIDE (_etext = .);
  PROVIDE (etext = .);
  
.rodata	: ALIGN(0x100000)
{
	. = . + 1;
	. = ALIGN(0x1000);
	. = ALIGN(0x1); /* align for .rodata.popcorn_migratemep__str___d__d__it */
	"popcorn-migratemep_aarch64.o"(.rodata.popcorn_migratemep__str___d__d__it); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.popcorn_migratemep__str_1_pthread_cr */
	"popcorn-migratemep_aarch64.o"(.rodata.popcorn_migratemep__str_1_pthread_cr); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.popcorn_migratemep__str_2_main__node */
	"popcorn-migratemep_aarch64.o"(.rodata.popcorn_migratemep__str_2_main__node); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.popcorn_migratemep__str_3_pthread_jo */
	"popcorn-migratemep_aarch64.o"(.rodata.popcorn_migratemep__str_3_pthread_jo); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_env___libc_start_main__str_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.rodata.src_env___libc_start_main__str_); /* size 0x1 */
	. = ALIGN(0x10); /* align for .rodata.src_env___libc_start_main___init_libc_pfd_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.rodata.src_env___libc_start_main___init_libc_pfd_); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_env___libc_start_main__str_1__dev_null_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.rodata.src_env___libc_start_main__str_1__dev_null_); /* size 0xa */
	. = ALIGN(0x8); /* align for .rodata.stderr */
	"/usr/local/popcorn/aarch64/lib/libc.a(stderr.o)"(.rodata.stderr); /* size 0x8 */
	. = ALIGN(0x8); /* align for .rodata.stdout */
	"/usr/local/popcorn/aarch64/lib/libc.a(stdout.o)"(.rodata.stdout); /* size 0x8 */
	. = ALIGN(0x8); /* align for .rodata.printf_core */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.printf_core); /* size 0x170 */
	. = ALIGN(0x8); /* align for .rodata.pop_arg */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.pop_arg); /* size 0x90 */
	. = ALIGN(0x10); /* align for .rodata.src_stdio_vfprintf_c_states */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf_c_states); /* size 0x1d0 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str______0X0x_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str______0X0x_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_1__null__ */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_1__null__); /* size 0x7 */
	. = ALIGN(0x10); /* align for .rodata.src_stdio_vfprintf_c_xdigits */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf_c_xdigits); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_2__0X_0X_0X_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_2__0X_0X_0X_); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_3_inf_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_3_inf_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_4_INF_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_4_INF_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_5_nan_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_5_nan_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_6_NAN_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_6_NAN_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_7___ */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_7___); /* size 0x2 */
	. = ALIGN(0x10); /* align for .rodata.src_errno_strerror_c_errid */
	"/usr/local/popcorn/aarch64/lib/libc.a(strerror.o)"(.rodata.src_errno_strerror_c_errid); /* size 0x58 */
	. = ALIGN(0x10); /* align for .rodata.src_errno_strerror_c_errmsg */
	"/usr/local/popcorn/aarch64/lib/libc.a(strerror.o)"(.rodata.src_errno_strerror_c_errmsg); /* size 0x70c */
	. = ALIGN(0x8); /* align for .rodata.src_signal_block_c_all_mask */
	"/usr/local/popcorn/aarch64/lib/libc.a(block.o)"(.rodata.src_signal_block_c_all_mask); /* size 0x8 */
	. = ALIGN(0x8); /* align for .rodata.src_signal_block_c_app_mask */
	"/usr/local/popcorn/aarch64/lib/libc.a(block.o)"(.rodata.src_signal_block_c_app_mask); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_migrate__str_Destinatio */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.rodata.src_migrate__str_Destinatio); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.src_migrate__str_1_0_____Unsu */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.rodata.src_migrate__str_1_0_____Unsu); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.src_migrate__str_2_src_migrat */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.rodata.src_migrate__str_2_src_migrat); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_migrate___func_____migrate_shim_internal___migrate_ */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.rodata.src_migrate___func_____migrate_shim_internal___migrate_); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_migrate__str_3_Could_not_ */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.rodata.src_migrate__str_3_Could_not_); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_migrate__str_4_Could_not_ */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.rodata.src_migrate__str_4_Could_not_); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_migrate___func___get_thread_pointer_get_thread */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.rodata.src_migrate___func___get_thread_pointer_get_thread); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_trigger__str_Could_not_ */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(trigger.o)"(.rodata.src_trigger__str_Could_not_); /* size 0x34 */
	. = ALIGN(0x1); /* align for .rodata.src_trigger__str_1_Could_not_ */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(trigger.o)"(.rodata.src_trigger__str_1_Could_not_); /* size 0x3b */
	. = ALIGN(0x1); /* align for .rodata.src_mapping__str_POPCORN_TH */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.rodata.src_mapping__str_POPCORN_TH); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_mapping__str_1_thread_sch */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.rodata.src_mapping__str_1_thread_sch); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_mapping__str_2_r_ */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.rodata.src_mapping__str_2_r_); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_mapping__str_3__lu__lu_ */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.rodata.src_mapping__str_3__lu__lu_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_mapping__str_4__d_ */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.rodata.src_mapping__str_4__d_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_ST_AARCH64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_ST_AARCH64); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_1__s_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_1__s_aarch64); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_2_ST_POWERPC */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_2_ST_POWERPC); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_3__s_powerpc */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_3__s_powerpc); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_4_ST_X86_64_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_4_ST_X86_64_); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_5__s_x86_64_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_5__s_x86_64_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_6__proc__d_m */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_6__proc__d_m); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_7_r_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_7_r_); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_8__lx__lx__s */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_8__lx__lx__s); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_9__stack__ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_9__stack__); /* size 0x8 */
	. = ALIGN(0x10); /* align for .rodata.src_userspace_switch_table_10_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace_switch_table_10_); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_init__str__stack_tra */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.rodata.src_init__str__stack_tra); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.src_init__str_1__stack_tra */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.rodata.src_init__str_1__stack_tra); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_init__str_2__stack_tra */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.rodata.src_init__str_2__stack_tra); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_init__str_3__stack_tra */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.rodata.src_init__str_3__stack_tra); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_init__str_4__stack_tra */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.rodata.src_init__str_4__stack_tra); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_init__str_5__stack_tra */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.rodata.src_init__str_5__stack_tra); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_rewrite__str__src_rewri */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.rodata.src_rewrite__str__src_rewri); /* size 0x42 */
	. = ALIGN(0x1); /* align for .rodata.src_rewrite__str_1__src_rewri */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.rodata.src_rewrite__str_1__src_rewri); /* size 0x68 */
	. = ALIGN(0x1); /* align for .rodata.src_rewrite__str_2__src_rewri */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.rodata.src_rewrite__str_2__src_rewri); /* size 0x54 */
	. = ALIGN(0x1); /* align for .rodata.src_rewrite__str_3__src_rewri */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.rodata.src_rewrite__str_3__src_rewri); /* size 0x61 */
	. = ALIGN(0x1); /* align for .rodata.src_util__str_aarch64_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.rodata.src_util__str_aarch64_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_util__str_1_powerpc64_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.rodata.src_util__str_1_powerpc64_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_util__str_2_x86_64_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.rodata.src_util__str_2_x86_64_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_util__str_3_unknown_un */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.rodata.src_util__str_3_unknown_un); /* size 0x21 */
	. = ALIGN(0x10); /* align for .rodata.src_arch_aarch64_properties_c_callee_saved_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.src_arch_aarch64_properties_c_callee_saved_aarch64); /* size 0x28 */
	. = ALIGN(0x10); /* align for .rodata.src_arch_aarch64_properties_c_callee_saved_size_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.src_arch_aarch64_properties_c_callee_saved_size_aarch64); /* size 0x28 */
	. = ALIGN(0x8); /* align for .rodata.properties_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.properties_aarch64); /* size 0x38 */
	. = ALIGN(0x1); /* align for .rodata.src_arch_aarch64_properties__str__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.src_arch_aarch64_properties__str__src_arch_); /* size 0x51 */
	. = ALIGN(0x8); /* align for .rodata.reg_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.reg_aarch64); /* size 0x300 */
	. = ALIGN(0x8); /* align for .rodata.regs_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.regs_aarch64); /* size 0xa8 */
	. = ALIGN(0x1); /* align for .rodata.src_arch_aarch64_regs__str__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.src_arch_aarch64_regs__str__src_arch_); /* size 0x4c */
	. = ALIGN(0x1); /* align for .rodata.src_arch_aarch64_regs__str_1__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.src_arch_aarch64_regs__str_1__src_arch_); /* size 0x4c */
	. = ALIGN(0x8); /* align for .rodata.is_callee_saved_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.is_callee_saved_powerpc64); /* size 0x208 */
	. = ALIGN(0x8); /* align for .rodata.callee_reg_size_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.callee_reg_size_powerpc64); /* size 0x210 */
	. = ALIGN(0x10); /* align for .rodata.src_arch_powerpc64_properties_c_callee_saved_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.src_arch_powerpc64_properties_c_callee_saved_powerpc64); /* size 0x4e */
	. = ALIGN(0x10); /* align for .rodata.src_arch_powerpc64_properties_c_callee_saved_size_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.src_arch_powerpc64_properties_c_callee_saved_size_powerpc64); /* size 0x4c */
	. = ALIGN(0x8); /* align for .rodata.properties_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.properties_powerpc64); /* size 0x38 */
	. = ALIGN(0x1); /* align for .rodata.src_arch_powerpc64_properties__str__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.src_arch_powerpc64_properties__str__src_arch_); /* size 0x56 */
	. = ALIGN(0x8); /* align for .rodata.reg_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.reg_powerpc64); /* size 0x218 */
	. = ALIGN(0x8); /* align for .rodata.regs_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.regs_powerpc64); /* size 0xa8 */
	. = ALIGN(0x1); /* align for .rodata.src_arch_powerpc64_regs__str__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.src_arch_powerpc64_regs__str__src_arch_); /* size 0x50 */
	. = ALIGN(0x1); /* align for .rodata.src_arch_powerpc64_regs__str_1__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.src_arch_powerpc64_regs__str_1__src_arch_); /* size 0x50 */
	. = ALIGN(0x2); /* align for .rodata.src_arch_x86_64_properties_c_callee_saved_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.src_arch_x86_64_properties_c_callee_saved_x86_64); /* size 0xe */
	. = ALIGN(0x2); /* align for .rodata.src_arch_x86_64_properties_c_callee_saved_size_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.src_arch_x86_64_properties_c_callee_saved_size_x86_64); /* size 0xe */
	. = ALIGN(0x8); /* align for .rodata.properties_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.properties_x86_64); /* size 0x38 */
	. = ALIGN(0x1); /* align for .rodata.src_arch_x86_64_properties__str__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.src_arch_x86_64_properties__str__src_arch_); /* size 0x4f */
	. = ALIGN(0x8); /* align for .rodata.reg_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.reg_x86_64); /* size 0x108 */
	. = ALIGN(0x8); /* align for .rodata.regs_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.regs_x86_64); /* size 0xa8 */
	. = ALIGN(0x1); /* align for .rodata.src_arch_x86_64_regs__str__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.src_arch_x86_64_regs__str__src_arch_); /* size 0x4b */
	. = ALIGN(0x1); /* align for .rodata.src_arch_x86_64_regs__str_1__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.src_arch_x86_64_regs__str_1__src_arch_); /* size 0x4b */
	. = ALIGN(0x1); /* align for .rodata.src_arch_x86_64_regs__str_2__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.src_arch_x86_64_regs__str_2__src_arch_); /* size 0x4a */
	. = ALIGN(0x1); /* align for .rodata.src_arch_x86_64_regs__str_3__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.src_arch_x86_64_regs__str_3__src_arch_); /* size 0x4a */
	. = ALIGN(0x8); /* align for .rodata.put_val_arch */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.put_val_arch); /* size 0xb0 */
	. = ALIGN(0x8); /* align for .rodata.points_to_stack */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.points_to_stack); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_data__str__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str__src_data_); /* size 0x50 */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_1__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_1__src_data_); /* size 0x3d */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_2__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_2__src_data_); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_3__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_3__src_data_); /* size 0x49 */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_4__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_4__src_data_); /* size 0x3f */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_5__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_5__src_data_); /* size 0x3d */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_6__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_6__src_data_); /* size 0x3f */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_7__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_7__src_data_); /* size 0x37 */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_8__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_8__src_data_); /* size 0x37 */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_9__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_9__src_data_); /* size 0x3f */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_10__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_10__src_data_); /* size 0x3f */
	. = ALIGN(0x8); /* align for .rodata.elf_begin */
	"/usr/local/popcorn/aarch64/lib/libelf.a(begin.o)"(.rodata.elf_begin); /* size 0x40 */
	. = ALIGN(0x8); /* align for .rodata.begin_c__elf_init */
	"/usr/local/popcorn/aarch64/lib/libelf.a(begin.o)"(.rodata.begin_c__elf_init); /* size 0xe0 */
	. = ALIGN(0x1); /* align for .rodata.begin_c_fmag */
	"/usr/local/popcorn/aarch64/lib/libelf.a(begin.o)"(.rodata.begin_c_fmag); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.begin__str__ELF_ */
	"/usr/local/popcorn/aarch64/lib/libelf.a(begin.o)"(.rodata.begin__str__ELF_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.begin__str_1___arch___ */
	"/usr/local/popcorn/aarch64/lib/libelf.a(begin.o)"(.rodata.begin__str_1___arch___); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.version__str_LIBELF_SAN */
	"/usr/local/popcorn/aarch64/lib/libelf.a(version.o)"(.rodata.version__str_LIBELF_SAN); /* size 0x15 */
	. = ALIGN(0x10); /* align for .rodata.32_xlatetof_c_xlate32_11 */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.rodata.32_xlatetof_c_xlate32_11); /* size 0x220 */
	. = ALIGN(0x8); /* align for .rodata._elf_scn_type */
	"/usr/local/popcorn/aarch64/lib/libelf.a(cook.o)"(.rodata._elf_scn_type); /* size 0x88 */
	. = ALIGN(0x8); /* align for .rodata._elf_cook */
	"/usr/local/popcorn/aarch64/lib/libelf.a(cook.o)"(.rodata._elf_cook); /* size 0x110 */
	. = ALIGN(0x8); /* align for .rodata._elf_scn_init */
	"/usr/local/popcorn/aarch64/lib/libelf.a(cook.o)"(.rodata._elf_scn_init); /* size 0xa0 */
	. = ALIGN(0x8); /* align for .rodata._elf_data_init */
	"/usr/local/popcorn/aarch64/lib/libelf.a(cook.o)"(.rodata._elf_data_init); /* size 0x58 */
	. = ALIGN(0x10); /* align for .rodata.64_xlatetof_c_xlate64_11 */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.rodata.64_xlatetof_c_xlate64_11); /* size 0x220 */
	. = ALIGN(0x10); /* align for .rodata._elf_fmsize */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.fsize.o)"(.rodata._elf_fmsize); /* size 0x220 */
	. = ALIGN(0x1); /* align for .rodata.src_exit_assert__str_Assertion_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(assert.o)"(.rodata.src_exit_assert__str_Assertion_); /* size 0x23 */
	. = ALIGN(0x10); /* align for .rodata.src_malloc_malloc_c_bin_tab */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.rodata.src_malloc_malloc_c_bin_tab); /* size 0x3c */
	. = ALIGN(0x10); /* align for .rodata.src_malloc_popcorn_malloc_c_bin_tab */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.rodata.src_malloc_popcorn_malloc_c_bin_tab); /* size 0x3c */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_fopen__str_rwa_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(fopen.o)"(.rodata.src_stdio_fopen__str_rwa_); /* size 0x4 */
	. = ALIGN(0x8); /* align for .rodata.vfscanf */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfscanf.o)"(.rodata.vfscanf); /* size 0x338 */
	. = ALIGN(0x10); /* align for .rodata.src_stdlib_qsort_qsort_p_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(qsort.o)"(.rodata.src_stdlib_qsort_qsort_p_); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_internal_floatscan__str_infinity_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(floatscan.o)"(.rodata.src_internal_floatscan__str_infinity_); /* size 0x9 */
	. = ALIGN(0x10); /* align for .rodata.src_internal_floatscan_c_decfloat_p10s */
	"/usr/local/popcorn/aarch64/lib/libc.a(floatscan.o)"(.rodata.src_internal_floatscan_c_decfloat_p10s); /* size 0x20 */
	. = ALIGN(0x4); /* align for .rodata.src_internal_floatscan_switch_table_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(floatscan.o)"(.rodata.src_internal_floatscan_switch_table_); /* size 0xc */
	. = ALIGN(0x4); /* align for .rodata.src_internal_floatscan_switch_table_2_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(floatscan.o)"(.rodata.src_internal_floatscan_switch_table_2_); /* size 0xc */
	. = ALIGN(0x10); /* align for .rodata.src_internal_intscan_c_table */
	"/usr/local/popcorn/aarch64/lib/libc.a(intscan.o)"(.rodata.src_internal_intscan_c_table); /* size 0x101 */
	. = ALIGN(0x1); /* align for .rodata.src_internal_intscan__str__________ */
	"/usr/local/popcorn/aarch64/lib/libc.a(intscan.o)"(.rodata.src_internal_intscan__str__________); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio___fdopen__str_rwa_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(__fdopen.o)"(.rodata.src_stdio___fdopen__str_rwa_); /* size 0x4 */
	. = ALIGN(0x10); /* align for .rodata.__fsmu8 */
	"/usr/local/popcorn/aarch64/lib/libc.a(internal.o)"(.rodata.__fsmu8); /* size 0xcc */
	. = . + 0x4; /* padding before .rodata.src_arch_x86_64_regs_switch_table_ */
	. = . + 0x42; /* padding after .rodata.src_arch_x86_64_regs_switch_table_ */
	*(.rodata);
}
  
  .rodata1        : { *(.rodata1) }
  .eh_frame       : ONLY_IF_RO { KEEP (*(.eh_frame)) }
  
.data	: ALIGN(0x100000)
{
	. = . + 1;
	. = ALIGN(0x1000);
	. = ALIGN(0x8); /* align for .data.src_stdio_stderr_c_f */
	"/usr/local/popcorn/aarch64/lib/libc.a(stderr.o)"(.data.src_stdio_stderr_c_f); /* size 0xe8 */
	. = ALIGN(0x8); /* align for .data.__stderr_used */
	"/usr/local/popcorn/aarch64/lib/libc.a(stderr.o)"(.data.__stderr_used); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.src_stdio_stdout_c_f */
	"/usr/local/popcorn/aarch64/lib/libc.a(stdout.o)"(.data.src_stdio_stdout_c_f); /* size 0xe8 */
	. = ALIGN(0x8); /* align for .data.__stdout_used */
	"/usr/local/popcorn/aarch64/lib/libc.a(stdout.o)"(.data.__stdout_used); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.__default_stacksize */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_create.o)"(.data.__default_stacksize); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.__default_guardsize */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_create.o)"(.data.__default_guardsize); /* size 0x8 */
	. = ALIGN(0x4); /* align for .data.src_migrate_c_origin_nid */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.data.src_migrate_c_origin_nid); /* size 0x4 */
	. = ALIGN(0x4); /* align for .data.__migrate_flag */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(trigger.o)"(.data.__migrate_flag); /* size 0x4 */
	. = ALIGN(0x4); /* align for .data._elf_sanity_checks */
	"/usr/local/popcorn/aarch64/lib/libelf.a(data.o)"(.data._elf_sanity_checks); /* size 0x4 */
	. = ALIGN(0x8); /* align for .data.rel.ro.local */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.data.rel.ro.local); /* size 0x10 */
	. = ALIGN(0x8); /* align for .data.rel.ro.local */
	"/usr/local/popcorn/aarch64/lib/libc.a(exit.o)"(.data.rel.ro.local); /* size 0x10 */
	. = ALIGN(0x8); /* align for .data.rel.ro.local */
	"/usr/local/popcorn/aarch64/lib/libc.a(__init_tls.o)"(.data.rel.ro.local); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.rel.ro */
	"/usr/local/popcorn/aarch64/lib/crt1.o"(.data.rel.ro); /* size 0x10 */
	*(.data);
}
  
  .data1          : { *(.data1) }
  _edata = .; PROVIDE (edata = .);
/*   . = ALIGN(0x100);   . = .;*/
 
 __bss_start = .;
  __bss_start__ = .;
  
.bss	: ALIGN(0x100000)
{
	. = . + 1;
	. = ALIGN(0x1000);
	. = ALIGN(0x8); /* align for .bss.__popcorn_stack_base */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.bss.__popcorn_stack_base); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.__progname */
	"/usr/local/popcorn/aarch64/lib/libc.a(libc.o)"(.bss.__progname); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.__progname_full */
	"/usr/local/popcorn/aarch64/lib/libc.a(libc.o)"(.bss.__progname_full); /* size 0x8 */
	. = ALIGN(0x1); /* align for .bss.src_stdio_stderr_c_buf */
	"/usr/local/popcorn/aarch64/lib/libc.a(stderr.o)"(.bss.src_stdio_stderr_c_buf); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.src_stdio_stdout_c_buf */
	"/usr/local/popcorn/aarch64/lib/libc.a(stdout.o)"(.bss.src_stdio_stdout_c_buf); /* size 0x408 */
	. = ALIGN(0x8); /* align for .bss.src_thread_pthread_create_c_dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_create.o)"(.bss.src_thread_pthread_create_c_dummy); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_thread_pthread_create_c_dummy_tsd */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_create.o)"(.bss.src_thread_pthread_create_c_dummy_tsd); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.__block_new_threads */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_create.o)"(.bss.__block_new_threads); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.src_thread_pthread_create_c_dummy_file */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_create.o)"(.bss.src_thread_pthread_create_c_dummy_file); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_thread_vmlock_c_vmlock */
	"/usr/local/popcorn/aarch64/lib/libc.a(vmlock.o)"(.bss.src_thread_vmlock_c_vmlock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.__environ */
	"/usr/local/popcorn/aarch64/lib/libc.a(__environ.o)"(.bss.__environ); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_env___init_tls_c_main_tls */
	"/usr/local/popcorn/aarch64/lib/libc.a(__init_tls.o)"(.bss.src_env___init_tls_c_main_tls); /* size 0x30 */
	. = ALIGN(0x10); /* align for .bss.src_env___init_tls_c_builtin_tls */
	"/usr/local/popcorn/aarch64/lib/libc.a(__init_tls.o)"(.bss.src_env___init_tls_c_builtin_tls); /* size 0x1a8 */
	. = ALIGN(0x4); /* align for .bss.src_stdio_ofl_c_ofl_lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(ofl.o)"(.bss.src_stdio_ofl_c_ofl_lock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_stdio_ofl_c_ofl_head */
	"/usr/local/popcorn/aarch64/lib/libc.a(ofl.o)"(.bss.src_stdio_ofl_c_ofl_head); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_stdio___stdio_exit_c_dummy_file */
	"/usr/local/popcorn/aarch64/lib/libc.a(__stdio_exit.o)"(.bss.src_stdio___stdio_exit_c_dummy_file); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.src_migrate_c_ni */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.bss.src_migrate_c_ni); /* size 0x180 */
	. = ALIGN(0x4); /* align for .bss.src_mapping_c_default_node */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.bss.src_mapping_c_default_node); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.src_mapping_c_mappings */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.bss.src_mapping_c_mappings); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_mapping_c_num_mappings */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.bss.src_mapping_c_num_mappings); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.aarch64_fn */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.bss.aarch64_fn); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.powerpc64_fn */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.bss.powerpc64_fn); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.x86_64_fn */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.bss.x86_64_fn); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_userspace_c_aarch64_handle */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.bss.src_userspace_c_aarch64_handle); /* size 0x8 */
	. = ALIGN(0x1); /* align for .bss.src_userspace_c_alloc_aarch64_fn */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.bss.src_userspace_c_alloc_aarch64_fn); /* size 0x1 */
	. = ALIGN(0x8); /* align for .bss.src_userspace_c_powerpc64_handle */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.bss.src_userspace_c_powerpc64_handle); /* size 0x8 */
	. = ALIGN(0x1); /* align for .bss.src_userspace_c_alloc_powerpc64_fn */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.bss.src_userspace_c_alloc_powerpc64_fn); /* size 0x1 */
	. = ALIGN(0x8); /* align for .bss.src_userspace_c_x86_64_handle */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.bss.src_userspace_c_x86_64_handle); /* size 0x8 */
	. = ALIGN(0x1); /* align for .bss.src_userspace_c_alloc_x86_64_fn */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.bss.src_userspace_c_alloc_x86_64_fn); /* size 0x1 */
	. = ALIGN(0x4); /* align for .bss._elf_version */
	"/usr/local/popcorn/aarch64/lib/libelf.a(data.o)"(.bss._elf_version); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss._elf_errno */
	"/usr/local/popcorn/aarch64/lib/libelf.a(data.o)"(.bss._elf_errno); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss._elf_fill */
	"/usr/local/popcorn/aarch64/lib/libelf.a(data.o)"(.bss._elf_fill); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_lite_malloc_c___simple_malloc_cur */
	"/usr/local/popcorn/aarch64/lib/libc.a(lite_malloc.o)"(.bss.src_malloc_lite_malloc_c___simple_malloc_cur); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_lite_malloc_c___simple_malloc_end */
	"/usr/local/popcorn/aarch64/lib/libc.a(lite_malloc.o)"(.bss.src_malloc_lite_malloc_c___simple_malloc_end); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_malloc_lite_malloc_c___simple_malloc_lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(lite_malloc.o)"(.bss.src_malloc_lite_malloc_c___simple_malloc_lock); /* size 0x8 */
	. = ALIGN(0x1000); /* align for .bss.src_malloc_malloc_c_mal */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.bss.src_malloc_malloc_c_mal); /* size 0x1000 */
	. = ALIGN(0x4); /* align for .bss.src_malloc_malloc_c_expand_heap_heap_lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.bss.src_malloc_malloc_c_expand_heap_heap_lock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_malloc_c_expand_heap_end */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.bss.src_malloc_malloc_c_expand_heap_end); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.src_malloc_popcorn_malloc_c_expand_heap_heap_lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.bss.src_malloc_popcorn_malloc_c_expand_heap_heap_lock); /* size 0x100 */
	. = ALIGN(0x10); /* align for .bss.src_malloc_popcorn_malloc_c_expand_heap_end */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.bss.src_malloc_popcorn_malloc_c_expand_heap_end); /* size 0x100 */
	. = ALIGN(0x8); /* align for .bss.src_signal_sigaction_c_handler_set */
	"/usr/local/popcorn/aarch64/lib/libc.a(sigaction.o)"(.bss.src_signal_sigaction_c_handler_set); /* size 0x8 */
	. = ALIGN(0x1); /* align for .bss.src_signal_sigaction_c_unmask_done */
	"/usr/local/popcorn/aarch64/lib/libc.a(sigaction.o)"(.bss.src_signal_sigaction_c_unmask_done); /* size 0x1 */
	. = ALIGN(0x8); /* align for .bss.src_stdio_fflush_c_dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(fflush.o)"(.bss.src_stdio_fflush_c_dummy); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_expand_heap_c___expand_heap_brk */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.bss.src_malloc_expand_heap_c___expand_heap_brk); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_malloc_expand_heap_c___expand_heap_mmap_step */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.bss.src_malloc_expand_heap_c___expand_heap_mmap_step); /* size 0x4 */
	. = ALIGN(0x10); /* align for .bss.src_malloc_expand_heap_c___expand_heap_node_node_arenas */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.bss.src_malloc_expand_heap_c___expand_heap_node_node_arenas); /* size 0x100 */
	. = ALIGN(0x10); /* align for .bss.src_malloc_expand_heap_c___expand_heap_node_node_sizes */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.bss.src_malloc_expand_heap_c___expand_heap_node_node_sizes); /* size 0x100 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_expand_heap_c_arena_start */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.bss.src_malloc_expand_heap_c_arena_start); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_malloc_expand_heap_c_set_arena_start_lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.bss.src_malloc_expand_heap_c_set_arena_start_lock); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_multibyte_mbrtowc_c_mbrtowc_internal_state */
	"/usr/local/popcorn/aarch64/lib/libc.a(mbrtowc.o)"(.bss.src_multibyte_mbrtowc_c_mbrtowc_internal_state); /* size 0x4 */
	*(.bss);
}
  
  _bss_end__ = . ; __bss_end__ = . ;
  . = ALIGN(32 / 8);
  . = ALIGN(32 / 8);
  __end__ = . ;
  _end = .; PROVIDE (end = .);
  . = DATA_SEGMENT_END (.);
  .eh_frame_hdr : { *(.eh_frame_hdr) }
  
  .gcc_except_table   : ONLY_IF_RO { *(.gcc_except_table
  .gcc_except_table.*) }
  /* These sections are generated by the Sun/Oracle C++ compiler.  */
  .exception_ranges   : ONLY_IF_RO { *(.exception_ranges
  .exception_ranges*) }
  /* Adjust the address for the data segment.  We want to adjust up to
     the same address within the page on the next page up.  */
  . = ALIGN (CONSTANT (MAXPAGESIZE)) - ((CONSTANT (MAXPAGESIZE) - .) & (CONSTANT (MAXPAGESIZE) - 1)); . = DATA_SEGMENT_ALIGN (CONSTANT (MAXPAGESIZE), CONSTANT (COMMONPAGESIZE));
  /* Exception handling  */
  .eh_frame       : ONLY_IF_RW { KEEP (*(.eh_frame)) }
  .gcc_except_table   : ONLY_IF_RW { *(.gcc_except_table .gcc_except_table.*) }
  .exception_ranges   : ONLY_IF_RW { *(.exception_ranges .exception_ranges*) }
  /* Thread Local Storage sections  */
  
.tdata	: ALIGN(0x100000)
{
	. = . + 1;
	. = ALIGN(0x1000);
	*(.tdata);
}
  
.tbss	: ALIGN(0x100000)
{
	. = . + 1;
	. = ALIGN(0x1000);
	. = ALIGN(0x8); /* align for .tbss.src_userspace_c_bounds */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.tbss.src_userspace_c_bounds); /* size 0x10 */
	. = ALIGN(0x8); /* align for .tbss.src_rewrite_c_src_ctx */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.tbss.src_rewrite_c_src_ctx); /* size 0xb050 */
	. = ALIGN(0x10); /* align for .tbss.src_rewrite_c_src_regs */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.tbss.src_rewrite_c_src_regs); /* size 0x62000 */
	. = ALIGN(0x10); /* align for .tbss.src_rewrite_c_src_callee */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.tbss.src_rewrite_c_src_callee); /* size 0x2000 */
	. = ALIGN(0x8); /* align for .tbss.src_rewrite_c_dest_ctx */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.tbss.src_rewrite_c_dest_ctx); /* size 0xb050 */
	. = ALIGN(0x10); /* align for .tbss.src_rewrite_c_dest_regs */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.tbss.src_rewrite_c_dest_regs); /* size 0x62000 */
	. = ALIGN(0x10); /* align for .tbss.src_rewrite_c_dest_callee */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.tbss.src_rewrite_c_dest_callee); /* size 0x2000 */
	*(.tbss);
}

  .preinit_array     :
  {
    PROVIDE_HIDDEN (__preinit_array_start = .);
    KEEP (*(.preinit_array))
    PROVIDE_HIDDEN (__preinit_array_end = .);
  }
  .init_array     :
  {
    PROVIDE_HIDDEN (__init_array_start = .);
    KEEP (*(SORT(.init_array.*)))
    KEEP (*(.init_array))
    PROVIDE_HIDDEN (__init_array_end = .);
  }
  .fini_array     :
  {
    PROVIDE_HIDDEN (__fini_array_start = .);
    KEEP (*(SORT(.fini_array.*)))
    KEEP (*(.fini_array))
    PROVIDE_HIDDEN (__fini_array_end = .);
  }
  .ctors          :
  {
    /* gcc uses crtbegin.o to find the start of
       the constructors, so we make sure it is
       first.  Because this is a wildcard, it
       doesn't matter if the user does not
       actually link against crtbegin.o; the
       linker won't look for a file to match a
       wildcard.  The wildcard also means that it
       doesn't matter which directory crtbegin.o
       is in.  */
    KEEP (*crtbegin.o(.ctors))
    KEEP (*crtbegin?.o(.ctors))
    /* We don't want to include the .ctor section from
       the crtend.o file until after the sorted ctors.
       The .ctor section from the crtend file contains the
       end of ctors marker and it must be last */
    KEEP (*(EXCLUDE_FILE (*crtend.o *crtend?.o ) .ctors))
    KEEP (*(SORT(.ctors.*)))
    KEEP (*(.ctors))
  }
  .dtors          :
  {
    KEEP (*crtbegin.o(.dtors))
    KEEP (*crtbegin?.o(.dtors))
    KEEP (*(EXCLUDE_FILE (*crtend.o *crtend?.o ) .dtors))
    KEEP (*(SORT(.dtors.*)))
    KEEP (*(.dtors))
  }
  .jcr            : { KEEP (*(.jcr)) }
  .data.rel.ro : 
   {
	*(.data.rel.ro.local* .gnu.linkonce.d.rel.ro.local.*)
	*(.data.rel.ro .data.rel.ro.* .gnu.linkonce.d.rel.ro.*) 
   }
  .dynamic        : { *(.dynamic) }
  .got            : { *(.got) *(.igot) }
  . = DATA_SEGMENT_RELRO_END (24, .);
  .got.plt        : { *(.got.plt)  *(.igot.plt) }
  .llvm_stackmaps : ALIGN(0x1000) { *(.llvm_stackmaps) }
/*  . = ALIGN(32 / 8);
  . = ALIGN(32 / 8);
  __end__ = . ;
  _end = .; PROVIDE (end = .);*/
  . = DATA_SEGMENT_END (.);
  /* Stabs debugging sections.  */
  .stab          0 : { *(.stab) }
  .stabstr       0 : { *(.stabstr) }
  .stab.excl     0 : { *(.stab.excl) }
  .stab.exclstr  0 : { *(.stab.exclstr) }
  .stab.index    0 : { *(.stab.index) }
  .stab.indexstr 0 : { *(.stab.indexstr) }
  .comment       0 : { *(.comment) }
  /* DWARF debug sections.
     Symbols in the DWARF debugging sections are relative to the beginning
     of the section so we begin them at 0.  */
  /* DWARF 1 */
  .debug          0 : { *(.debug) }
  .line           0 : { *(.line) }
  /* GNU DWARF 1 extensions */
  .debug_srcinfo  0 : { *(.debug_srcinfo) }
  .debug_sfnames  0 : { *(.debug_sfnames) }
  /* DWARF 1.1 and DWARF 2 */
  .debug_aranges  0 : { *(.debug_aranges) }
  .debug_pubnames 0 : { *(.debug_pubnames) }
  /* DWARF 2 */
  .debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
  .debug_abbrev   0 : { *(.debug_abbrev) }
  .debug_line     0 : { *(.debug_line) }
  .debug_frame    0 : { *(.debug_frame) }
  .debug_str      0 : { *(.debug_str) }
  .debug_loc      0 : { *(.debug_loc) }
  .debug_macinfo  0 : { *(.debug_macinfo) }
  /* SGI/MIPS DWARF 2 extensions */
  .debug_weaknames 0 : { *(.debug_weaknames) }
  .debug_funcnames 0 : { *(.debug_funcnames) }
  .debug_typenames 0 : { *(.debug_typenames) }
  .debug_varnames  0 : { *(.debug_varnames) }
  /* DWARF 3 */
  .debug_pubtypes 0 : { *(.debug_pubtypes) }
  .debug_ranges   0 : { *(.debug_ranges) }
  /* DWARF Extension.  */
  .debug_macro    0 : { *(.debug_macro) }
  .ARM.attributes 0 : { KEEP (*(.ARM.attributes)) KEEP (*(.gnu.attributes)) }
  .note.gnu.arm.ident 0 : { KEEP (*(.note.gnu.arm.ident)) }
  /DISCARD/ : { *(.note.GNU-stack) *(.gnu_debuglink) *(.gnu.lto_*) *(.note.gnu.build-id) }
}
