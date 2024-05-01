## Crates in ArceOS

下面是拆分出的独立模块及其功能，分为crates模块，modules模块和应用模块。

### crates模块

| 模块             | 链接                                                  | 介绍                  |
| ---------------- | ----------------------------------------------------- | --------------------- |
| allocator        | https://github.com/Arceos-crates/allocator.git        | 内存分配器模块        |
| axerrno          | https://github.com/Arceos-crates/axerrno.git          | 错误码定义模块        |
| axfs_vfs         | https://github.com/Arceos-crates/axfs_vfs.git         | 虚拟文件系统模块      |
| crate_interface  | https://github.com/Arceos-crates/crate_interface.git  | 模块接口定义模块      |
| driver_display   | https://github.com/Arceos-crates/driver_display.git   | 显示驱动模块          |
| driver_virtio    | https://github.com/Arceos-crates/driver_virtio.git    | 虚拟化驱动模块        |
| handler_table    | https://github.com/Arceos-crates/handler_table.git    | 中断处理表模块        |
| linked_list      | https://github.com/Arceos-crates/linked_list.git      | 链表数据结构模块      |
| page_table_entry | https://github.com/Arceos-crates/page_table_entry.git | 页表项管理模块        |
| ratio            | https://github.com/Arceos-crates/ratio.git            | 比例控制模块          |
| spinlock         | https://github.com/Arceos-crates/spinlock.git         | 自旋锁模块            |
| arm_gic          | https://github.com/Arceos-crates/arm_gic.git          | ARM通用中断控制器模块 |
| axfs_devfs       | https://github.com/Arceos-crates/axfs_devfs.git       | 设备文件系统模块      |
| axio             | https://github.com/Arceos-crates/axio.git             | 输入输出管理模块      |
| driver_block     | https://github.com/Arceos-crates/driver_block.git     | 块设备驱动模块        |
| driver_net       | https://github.com/Arceos-crates/driver_net.git       | 网络设备驱动模块      |
| dw_apb_uart      | https://github.com/Arceos-crates/dw_apb_uart.git      | UART串口驱动模块      |
| kernel_guard     | https://github.com/Arceos-crates/kernel_guard.git     | 内核保护模块          |
| memory_addr      | https://github.com/Arceos-crates/memory_addr.git      | 内存地址管理模块      |
| percpu           | https://github.com/Arceos-crates/percpu.git           | 多核心CPU管理模块     |
| scheduler        | https://github.com/Arceos-crates/scheduler.git        | 调度器模块            |
| timer_list       | https://github.com/Arceos-crates/timer_list.git       | 定时器管理模块        |
| arm_pl011        | https://github.com/Arceos-crates/arm_pl011.git        | ARM串口驱动模块       |
| axfs_ramfs       | https://github.com/Arceos-crates/axfs_ramfs.git       | RAM文件系统模块       |
| capability       | https://github.com/Arceos-crates/capability.git       | 权限管理模块          |
| driver_common    | https://github.com/Arceos-crates/driver_common.git    | 共用驱动模块          |
| driver_pci       | https://github.com/Arceos-crates/driver_pci.git       | PCI设备驱动模块       |
| flatten_objects  | https://github.com/Arceos-crates/flatten_objects.git  | 对象展开模块          |
| lazy_init        | https://github.com/Arceos-crates/lazy_init.git        | 懒加载模块            |
| page_table       | https://github.com/Arceos-crates/page_table.git       | 页表管理模块          |
| percpu_macros    | https://github.com/Arceos-crates/percpu_macros.git    | 多核心宏定义模块      |
| slab_allocator   | https://github.com/Arceos-crates/slab_allocator.git   | Slab分配器模块        |
| tuple_for_each   | https://github.com/Arceos-crates/tuple_for_each.git   | 元组遍历模块          |

### modules模块

| 模块      | 链接                                           | 介绍           |
| --------- | ---------------------------------------------- | -------------- |
| axalloc   | https://github.com/Arceos-crates/axalloc.git   | 内存分配模块   |
| axconfig  | https://github.com/Arceos-crates/axconfig.git  | 配置管理模块   |
| axdisplay | https://github.com/Arceos-crates/axdisplay.git | 显示管理模块   |
| axdriver  | https://github.com/Arceos-crates/axdriver.git  | 驱动模块       |
| axfs      | https://github.com/Arceos-crates/axfs.git      | 文件系统模块   |
| axhal     | https://github.com/Arceos-crates/axhal.git     | 硬件抽象层模块 |
| axlog     | https://github.com/Arceos-crates/axlog.git     | 日志管理模块   |
| axnet     | https://github.com/Arceos-crates/axnet.git     | 网络管理模块   |
| axruntime | https://github.com/Arceos-crates/axruntime.git | 运行时管理模块 |
| axsync    | https://github.com/Arceos-crates/axsync.git    | 同步管理模块   |
| axtask    | https://github.com/Arceos-crates/axtask.git    | 任务管理模块   |

### 应用模块

| 模块       | 链接                                            | 介绍                            |
| ---------- | ----------------------------------------------- | ------------------------------- |
| display    | https://github.com/Arceos-crates/display.git    | 显示模块                        |
| exception  | https://github.com/Arceos-crates/exception.git  | 异常处理模块                    |
| helloworld | https://github.com/Arceos-crates/helloworld.git | 示例模块 - 打印 "Hello, World!" |
| memtest    | https://github.com/Arceos-crates/memtest.git    | 内存测试模块                    |
| bwbench    | https://github.com/Arceos-crates/bwbench.git    | 带宽基准测试模块                |
| echoserver | https://github.com/Arceos-crates/echoserver.git | 回显服务器模块                  |
| httpclient | https://github.com/Arceos-crates/httpclient.git | HTTP客户端模块                  |
| httpserver | https://github.com/Arceos-crates/httpserver.git | HTTP服务器模块                  |
| udpserver  | https://github.com/Arceos-crates/udpserver.git  | UDP服务器模块                   |
| shell      | https://github.com/Arceos-crates/shell.git      | 命令行Shell模块                 |
| parallel   | https://github.com/Arceos-crates/parallel.git   | 并行处理模块                    |
| priority   | https://github.com/Arceos-crates/priority.git   | 优先级管理模块                  |
| sleep      | https://github.com/Arceos-crates/sleep.git      | 睡眠管理模块                    |
| tls        | https://github.com/Arceos-crates/tls.git        | TLS协议支持模块                 |
| yield      | https://github.com/Arceos-crates/yield.git      | CPU让渡模块                     |