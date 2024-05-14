Что нужно сделать?

Задания:

1.написать свою реализацию ps ax используя анализ /proc
Результат ДЗ - рабочий скрипт который можно запустить

2.написать свою реализацию lsof
Результат ДЗ - рабочий скрипт который можно запустить





1.1 В качестве теста буду использовать Vagrant образ ubuntu2204.
    tep@tep-HYM-WXX:~/OTUS/15. Управление процессами$ cat Vagrantfile 

    Vagrant.configure("2") do |config|
        config.vm.box = "generic/ubuntu2204"
        config.vm.synced_folder "./", "/vagrant/"
        config.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.cpus = "1"
        end
    end
    tep@tep-HYM-WXX:~/OTUS/15. Управление процессами$ 



1.2 Запускаю ВМ.
    tep@tep-HYM-WXX:~/OTUS/15. Управление процессами$ vagrant status
    Current machine states:

    default                   running (virtualbox)

    The VM is running. To stop this VM, you can run `vagrant halt` to
    shut it down forcefully, or you can run `vagrant suspend` to simply
    suspend the virtual machine. In either case, to restart it again,
    simply run `vagrant up`.
    tep@tep-HYM-WXX:~/OTUS/15. Управление процессами$ 



1.3 Подключаюсь к ВМ
    tep@tep-HYM-WXX:~/OTUS/15. Управление процессами$ vagrant ssh default
    Last login: Tue May 14 08:54:27 2024 from 10.0.2.2
    vagrant@ubuntu2204:~$ sudo -i
    root@ubuntu2204:~# 



1.4 Проверка работы скрипта ps.sh / скрипт обрабатывает содержимое файла /proc/*/status 
и выводит таблицу на экран. Вывод скрипта:
    root@ubuntu2204:~# cd /vagrant/
        root@ubuntu2204:/vagrant# ./ps.sh 
        PID     STAT            NAME
        1       S (sleeping)    systemd
        2       S (sleeping)    kthreadd
        3       I (idle)        rcu_gp
        4       I (idle)        rcu_par_gp
        5       I (idle)        slub_flushwq
        6       I (idle)        netns
        8       I (idle)        kworker/0:0H-events_highpri
        10      I (idle)        mm_percpu_wq
        11      S (sleeping)    rcu_tasks_rude_
        12      S (sleeping)    rcu_tasks_trace
        13      S (sleeping)    ksoftirqd/0
        14      I (idle)        rcu_sched
        15      S (sleeping)    migration/0
        16      S (sleeping)    idle_inject/0
        18      S (sleeping)    cpuhp/0
        19      S (sleeping)    kdevtmpfs
        20      I (idle)        inet_frag_wq
        21      S (sleeping)    kauditd
        22      S (sleeping)    khungtaskd
        23      S (sleeping)    oom_reaper
        24      I (idle)        writeback
        25      S (sleeping)    kcompactd0
        26      S (sleeping)    ksmd
        27      S (sleeping)    khugepaged
        73      I (idle)        kintegrityd
        74      I (idle)        kblockd
        75      I (idle)        blkcg_punt_bio
        76      I (idle)        tpm_dev_wq
        77      I (idle)        ata_sff
        78      I (idle)        md
        79      I (idle)        edac-poller
        80      I (idle)        devfreq_wq
        81      S (sleeping)    watchdogd
        82      I (idle)        kworker/u2:1-writeback
        83      I (idle)        kworker/0:1H-kblockd
        85      S (sleeping)    kswapd0
        86      S (sleeping)    ecryptfs-kthrea
        88      I (idle)        kthrotld
        89      I (idle)        acpi_thermal_pm
        91      S (sleeping)    scsi_eh_0
        92      I (idle)        scsi_tmf_0
        93      S (sleeping)    scsi_eh_1
        94      I (idle)        scsi_tmf_1
        96      I (idle)        vfio-irqfd-clea
        98      I (idle)        mld
        99      I (idle)        ipv6_addrconf
        108     I (idle)        kstrp
        111     I (idle)        zswap-shrink
        112     I (idle)        kworker/u3:0
        117     I (idle)        charger_manager
        152     S (sleeping)    scsi_eh_2
        153     I (idle)        kworker/0:2-cgroup_destroy
        154     I (idle)        scsi_tmf_2
        155     I (idle)        cryptd
        201     I (idle)        kdmflush
        227     I (idle)        raid5wq
        278     S (sleeping)    jbd2/dm-0-8
        279     I (idle)        ext4-rsv-conver
        338     S (sleeping)    systemd-journal
        368     I (idle)        kaluad
        369     I (idle)        kmpath_rdacd
        371     I (idle)        kmpathd
        373     I (idle)        kmpath_handlerd
        374     S (sleeping)    multipathd
        375     S (sleeping)    systemd-udevd
        500     S (sleeping)    jbd2/sda2-8
        503     I (idle)        ext4-rsv-conver
        516     S (sleeping)    systemd-network
        558     S (sleeping)    systemd-resolve
        563     S (sleeping)    haveged
        622     S (sleeping)    cron
        625     S (sleeping)    dbus-daemon
        635     S (sleeping)    networkd-dispat
        636     S (sleeping)    polkitd
        637     S (sleeping)    rsyslogd
        642     S (sleeping)    systemd-logind
        644     S (sleeping)    udisksd
        677     S (sleeping)    agetty
        688     S (sleeping)    ifplugd
        697     S (sleeping)    ModemManager
        740     S (sleeping)    VBoxService
        1179    S (sleeping)    sshd
        3043    S (sleeping)    snapd
        3716    S (sleeping)    sshd
        3719    S (sleeping)    systemd
        3720    S (sleeping)    (sd-pam)
        3721    I (idle)        kworker/u2:0-ext4-rsv-conversion
        3818    S (sleeping)    sshd
        3819    S (sleeping)    bash
        3958    I (idle)        kworker/0:1-cgroup_destroy
        3978    S (sleeping)    fwupd
        3983    S (sleeping)    upowerd
        4009    S (sleeping)    gpg-agent
        4059    I (idle)        kworker/u2:2-ext4-rsv-conversion
        4060    S (sleeping)    sshd
        4113    S (sleeping)    sshd
        4114    S (sleeping)    bash
        4122    S (sleeping)    sudo
        4123    S (sleeping)    sudo
        4124    S (sleeping)    bash
        4134    I (idle)        kworker/0:0-events
        4153    S (sleeping)    ps.sh
        4157    R (running)     cat
        4158    S (sleeping)    grep
        4159    S (sleeping)    awk
        root@ubuntu2204:/vagrant# 



---------------------------------------------------------------------------------------


2. Проверка работы скрипта lsof.sh / скрипт обрабатывает файлы /proc/*/status, /proc/*/stat, /proc/*/fd и /proc/*/maps 
     Вывод скрипт(не полный)): 

        COMMAND PID     NAME
        systemd 1       /dev/null
        systemd 1       /dev/null
        systemd 1       /proc/1/mountinfo
        systemd 1       socket:[19866]
        systemd 1       socket:[19892]
        systemd 1       socket:[19994]
        systemd 1       anon_inode:inotify
        systemd 1       socket:[20072]
        systemd 1       socket:[20078]
        systemd 1       socket:[20282]
        systemd 1       socket:[17972]
        systemd 1       socket:[17971]
        systemd 1       anon_inode:inotify
        systemd 1       /run/initctl
        systemd 1       socket:[17974]
        systemd 1       socket:[17967]
        systemd 1       socket:[17969]
        systemd 1       anon_inode:inotify
        systemd 1       socket:[17955]
        systemd 1       /proc/swaps
        systemd 1       socket:[17937]
        ...

        systemd-journal 338     /dev/kmsg
        systemd-journal 338     anon_inode:[eventpoll]
        systemd-journal 338     /dev/kmsg
        systemd-journal 338     /run/systemd/journal/kernel-seqnum
        systemd-journal 338     /usr/lib/systemd/libsystemd-shared-249.so
        systemd-journal 338     /usr/lib/systemd/systemd-journald
        systemd-journal 338     /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
        systemd-journal 338     /usr/lib/x86_64-linux-gnu/libacl.so.1.1.2301
        systemd-journal 338     /usr/lib/x86_64-linux-gnu/libaudit.so.1.0.0
        systemd-journal 338     /usr/lib/x86_64-linux-gnu/libblkid.so.1.1.0
        systemd-journal 338     /usr/lib/x86_64-linux-gnu/libcap-ng.so.0.0.0
        systemd-journal 338     /usr/lib/x86_64-linux-gnu/libcap.so.2.44
        systemd-journal 338     /usr/lib/x86_64-linux-gnu/libcrypto.so.3
        systemd-journal 338     /usr/lib/x86_64-linux-gnu/libcrypt.so.1.1.0
        systemd-journal 338     /usr/lib/x86_64-linux-gnu/libc.so.6
        systemd-journal 338     /usr/lib/x86_64-linux-gnu/libgcrypt.so.20.3.4
        systemd-journal 338     /usr/lib/x86_64-linux-gnu/libgpg-error.so.0.32.1
        systemd-journal 338     /usr/lib/x86_64-linux-gnu/libip4tc.so.2.0.0
        systemd-journal 338     /usr/lib/x86_64-linux-gnu/libkmod.so.2.3.7
        systemd-journal 338     /usr/lib/x86_64-linux-gnu/liblz4.so.1.9.3
        systemd-journal 338     /usr/lib/x86_64-linux-gnu/liblzma.so.5.2.5
        systemd-journal 338     /usr/lib/x86_64-linux-gnu/libmount.so.1.1.0
        ...

        networkd-dispat 635     /usr/lib/x86_64-linux-gnu/libgio-2.0.so.0.7200.4
        networkd-dispat 635     /usr/lib/x86_64-linux-gnu/libgirepository-1.0.so.1.0.0
        networkd-dispat 635     /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.7200.4
        networkd-dispat 635     /usr/lib/x86_64-linux-gnu/libgmodule-2.0.so.0.7200.4
        networkd-dispat 635     /usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0.7200.4
        networkd-dispat 635     /usr/lib/x86_64-linux-gnu/libgpg-error.so.0.32.1
        networkd-dispat 635     /usr/lib/x86_64-linux-gnu/liblz4.so.1.9.3
        networkd-dispat 635     /usr/lib/x86_64-linux-gnu/liblzma.so.5.2.5
        networkd-dispat 635     /usr/lib/x86_64-linux-gnu/libmount.so.1.1.0
        networkd-dispat 635     /usr/lib/x86_64-linux-gnu/libm.so.6
        networkd-dispat 635     /usr/lib/x86_64-linux-gnu/libpcre2-8.so.0.10.4
        networkd-dispat 635     /usr/lib/x86_64-linux-gnu/libpcre.so.3.13.3
        networkd-dispat 635     /usr/lib/x86_64-linux-gnu/libselinux.so.1
        ...

        sshd    3818    /dev/ptmx
        sshd    3818    /run/systemd/sessions/15.ref
        sshd    3818    /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
        sshd    3818    /usr/lib/x86_64-linux-gnu/libaudit.so.1.0.0
        sshd    3818    /usr/lib/x86_64-linux-gnu/libcap-ng.so.0.0.0
        sshd    3818    /usr/lib/x86_64-linux-gnu/libcap.so.2.44
        sshd    3818    /usr/lib/x86_64-linux-gnu/libcom_err.so.2.1
        sshd    3818    /usr/lib/x86_64-linux-gnu/libcrypto.so.3
        sshd    3818    /usr/lib/x86_64-linux-gnu/libcrypt.so.1.1.0
        sshd    3818    /usr/lib/x86_64-linux-gnu/libc.so.6
        sshd    3818    /usr/lib/x86_64-linux-gnu/libgcrypt.so.20.3.4
        sshd    3818    /usr/lib/x86_64-linux-gnu/libgpg-error.so.0.32.1
        ...

-----------------------------------------------------------------------------------------------------