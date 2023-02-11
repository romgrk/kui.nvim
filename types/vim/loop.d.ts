
type Callback<T> = (error: Error | null, data: T) => void;

type FStat = {
  dev: number;         /* ID of device containing file */
  ino: number;         /* Inode number */
  mode: number;        /* File type and mode */
  nlink: number;       /* Number of hard links */
  uid: number;         /* User ID of owner */
  gid: number;         /* Group ID of owner */
  rdev: number;        /* Device ID (if special file) */
  size: number;        /* Total size, in bytes */
  blksize: number;     /* Block size for filesystem I/O */
  blocks: number;      /* Number of 512B blocks allocated */

  /* Since Linux 2.6, the kernel supports nanosecond
  precision for the following timestamp fields.
  For the details before Linux 2.6, see NOTES. */

  atim: number;  /* Time of last access */
  mtim: number;  /* Time of last modification */
  ctim: number;  /* Time of last status change */
}

export class Timer {
  start(delay: number, repeat: number, fn: Function): void;
  stop(): void;
  close(): void;
}

export interface Loop {
  /** High-resolution timer, in nano-seconds */
  hrtime(): number;

  new_timer(): Timer;

  fs_open(path: string, mode: string, permissions: string | number, callback: Callback<number>): void;
  fs_fstat(fd: number, callback: Callback<FStat>): void;
  fs_read(fd: number, length: number, offset: number, callback: Callback<string>): void;
  fs_close(fd: number, callback: Callback<undefined>): void;
}
