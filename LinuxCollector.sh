# !/bin/bash

# Создание папок
function create_folders {
    # Проверяем наличие папки files/logs
    if [ -d ./files/logs ]; then
        echo "Папка files/logs существует";
    else
        echo "Папка files/logs не существует";
        # Создаем папку files/logs
        mkdir -p ./files/logs;
    fi

    # Проверяем наличие папки files/etc
    if [ -d ./files/etc ]; then
        echo "Папка files/etc существует";
    else
        echo "Папка files/etc не существует";
        # Создаем папку files/etc
        mkdir ./files/etc;
    fi
    echo "Папки созданы";
}



# Сбор системной информации: аппаратные устройства, полная информация о версии ОС, версия ядра (system_info.txt)
function get_system_info {
    # Проверяем наличие команды hostnamectl
    if command -v hostnamectl &> /dev/null; then
        # Получаем информацию о версии ОС
        os_info=$(hostnamectl);
        # Записываем информацию в файл
        echo -e "\n\nhostnamectl" >> ./files/system_info.txt;
        echo '--------------------------------' >> ./files/system_info.txt;
        echo "$os_info" >> ./files/system_info.txt;                
    else
        echo "Не удалось получить информацию о версии ОС (hostnamectl)";
    fi

    # Проверяем наличие команды lsb_release
    if command -v lsb_release &> /dev/null; then
        # Получаем информацию о версии ОС
        os_info=$(lsb_release -a);
        # Записываем информацию в файл
        echo -e "\n\nlsb_release" >> ./files/system_info.txt;
        echo '--------------------------------' >> ./files/system_info.txt;
        echo "$os_info" >> ./files/system_info.txt;
    else
        echo "Не удалось получить информацию о версии ОС (lsb_release)";
    fi

    # Проверяем наличие команды uname
    if command -v uname &> /dev/null; then
        # Получаем информацию о версии ядра
        kernel_info=$(uname -a);
        # Записываем информацию в файл
        echo -e "\n\nuname" >> ./files/system_info.txt;
        echo '--------------------------------' >> ./files/system_info.txt;
        echo "$kernel_info" >> ./files/system_info.txt;
    else
        echo "Не удалось получить информацию о версии ядра (uname)";
    fi

    # Проверяем наличие команды lscpu
    if command -v lscpu &> /dev/null; then
        # Получаем информацию о процессоре
        cpu_info=$(lscpu);
        # Записываем информацию в файл
        echo -e "\n\nlscpu" >> ./files/system_info.txt;
        echo '--------------------------------' >> ./files/system_info.txt;
        echo "$cpu_info" >> ./files/system_info.txt;
    else
        echo "Не удалось получить информацию о процессоре (lscpu)";
    fi

    # Проверяем наличие команды lspci
    if command -v lspci &> /dev/null; then
        # Получаем информацию о видеокарте
        gpu_info=$(lspci | grep VGA);
        # Записываем информацию в файл
        echo -e "\n\nlspci" >> ./files/system_info.txt;
        echo '--------------------------------' >> ./files/system_info.txt;
        echo "$gpu_info" >> ./files/system_info.txt;
    else
        echo "Не удалось получить информацию о видеокарте (lspci)";
    fi

    # Проверяем наличие команды lsusb
    if command -v lsusb &> /dev/null; then
        # Получаем информацию о USB устройствах
        usb_info=$(lsusb);
        # Записываем информацию в файл
        echo -e "\n\nlsusb" >> ./files/system_info.txt;
        echo '--------------------------------' >> ./files/system_info.txt;
        echo "$usb_info" >> ./files/system_info.txt;
    else
        echo "Не удалось получить информацию о USB устройствах (lsusb)";
    fi

    # Проверяем наличие команды lsmem
    if command -v lsmem &> /dev/null; then
        # Получаем информацию о памяти
        mem_info=$(lsmem);
        # Записываем информацию в файл
        echo -e "\n\nlsmem" >> ./files/system_info.txt;
        echo '--------------------------------' >> ./files/system_info.txt;
        echo "$mem_info" >> ./files/system_info.txt;
    else
        echo "Не удалось получить информацию о памяти (lsmem)";
    fi

    # Проверяем наличие команды dmidecode
    if command -v dmidecode &> /dev/null; then
        # Получаем информацию о BIOS
        bios_info=$(dmidecode -t bios);
        # Записываем информацию в файл
        echo -e "\n\nBIOS" >> ./files/system_info.txt;
        echo '--------------------------------' >> ./files/system_info.txt;
        echo "$bios_info" >> ./files/system_info.txt;
    else
        echo "Не удалось получить информацию о BIOS (dmidecode)";
    fi

    # Проверяем наличие команды lsmod
    if command -v lsmod &> /dev/null; then
        # Получаем информацию о модулях ядра
        kernel_info=$(lsmod);
        # Записываем информацию в файл
        echo -e "\n\nlsmod" >> ./files/system_info.txt;
        echo '--------------------------------' >> ./files/system_info.txt;
        echo "$kernel_info" >> ./files/system_info.txt;
    else
        echo "Не удалось получить информацию о модулях ядра (lsmod)";
    fi

        # Проверяем наличие команды lshw
    if command -v lshw &> /dev/null; then
        # Получаем информацию об аппаратных устройствах
        system_info=$(lshw);
        # Записываем информацию в файл
        echo -e "\n\nlshw" >> ./files/system_info.txt;
        echo '--------------------------------' >> ./files/system_info.txt;
        echo "$system_info" >> ./files/system_info.txt;
    else
        echo "Не удалось получить информацию об аппаратных устройствах (lshw)";
    fi
    echo "Информация о системе собрана";
};



# Сбор информации о работе системы, последних перезагрузках и выключениях (up_last_time.txt)
function get_up_last_time {
    # Проверяем наличие команды uptime
    if command -v uptime &> /dev/null; then
        # Получаем информацию о времени работы системы
        uptime=$(uptime);
        # Записываем данные в файл
        echo "Время работы системы: $uptime" >> ./files/up_last_time.txt;
    else
        echo "Не удалось получить информацию о времени работы системы (uptime)";
    fi
    # Проверяем наличие команды last
    if command -v last &> /dev/null; then
        # Получаем информацию о последней перезагрузке
        last_reboot=$(last reboot);
        # Записываем данные в файл
        echo "Последняя перезагрузка: $last_reboot" >> ./files/up_last_time.txt;
        # Получаем информацию о последнем выключении
        last_shutdown=$(last shutdown);
        # Записываем данные в файл
        echo "Последнее выключение: $last_shutdown" >> ./files/up_last_time.txt;
    else
        echo "Не удалось получить информацию о последних перезагрузках и выключениях (last)";
    fi
    echo "Информация о работе системы, последних перезагрузках и выключениях собрана";
};



# Сбор подробной информации о сервисах (services.txt)
function get_services_info {
    # Проверяем наличие команды systemctl
    if command -v systemctl &> /dev/null; then
        # Получаем информацию о сервисах
        services_info=$(systemctl list-units --type service --all);
        # Записываем информацию в файл
        echo "$services_info" > ./files/services.txt;
    else
        echo "Не удалось получить информацию о сервисах (systemctl)";
    fi
    echo "Информация о сервисах собрана";
};



# Сбор информации о установленных пакетах (packages.txt)
function get_packages_info {
    # Проверяем наличие команды dpkg
    if command -v dpkg &> /dev/null; then
        # Получаем информацию о пакетах
        dpkg_info=$(dpkg -l);
        # Записываем информацию в файл
        echo "$dpkg_info" > ./files/packages.txt;
        # Последее время и дата обновления пакетов dpkg
        dpkg_last_update=$(stat -c %y /var/lib/dpkg/status);
        echo "Последнее обновление пакетов dpkg: $dpkg_last_update" >> ./files/packages.txt;
    # Проверяем наличие команды rpm
    elif command -v rpm &> /dev/null; then
        # Получаем информацию о пакетах
        rpm_info=$(rpm -qa --last);
        # Записываем информацию в файл
        echo "$rpm_info" > ./files/packages.txt;
    else
        echo "Не удалось получить информацию о пакетах (dpkg или rpm)";
    fi
    echo "Информация о пакетах собрана";
};



# Сбор информации о фильтрации трафика iptables или ufw (iptables.txt)
function get_iptables_info {
    # Проверяем наличие команды iptables
    if command -v iptables &> /dev/null; then
        # Получаем информацию о фильтрации трафика
        iptables_info=$(sudo iptables -L -n -v);
        # Записываем информацию в файл
        echo "$iptables_info" > ./files/iptables.txt;
    # Проверяем наличие команды ufw
    elif command -v ufw &> /dev/null; then
        # Получаем информацию о фильтрации трафика
        ufw_info=$(sudo ufw status verbose);
        # Записываем информацию в файл
        echo "$ufw_info" > ./files/iptables.txt;
    else
        echo "Не удалось получить информацию о фильтрации трафика (iptables или ufw)";
    fi
    echo "Информация о фильтрации трафика собрана";
};



# Сбор информации о пользователях их права доступа и парольную политику (users_info.txt)
function get_users_info {
    # Получаем список пользователей
    users=$(cut -f 1 -d: /etc/passwd);
    echo 'Информация о пользователях' > ./files/users_info.txt;
    echo '----------------' >> ./files/users_info.txt;
    # Перебираем пользователей
    for user in $users; do
        # Получаем информацию о пользователе
        user_info=$(id $user);
        # Получаем права доступа
        access=$(sudo cat /etc/sudoers | grep $user);
        # Получаем парольную политику
        password_policy=$(sudo chage -l $user);

        # Записываем информацию в файл
        echo "$user_info" >> ./files/users_info.txt;
        echo "$access" >> ./files/users_info.txt;
        echo "$password_policy" >> ./files/users_info.txt;
        echo '----------------' >> ./files/users_info.txt;
    done
    echo "Информация о пользователях собрана";
};



# Сбор сетевых параметров: ip, маска, шлюз, dns, mac адрес, mtu, статус (network_info.txt).
function get_network_info {
    # Получаем список сетевых интерфейсов
    if command -v ip &> /dev/null; then
        interfaces=$(ip a | awk '/^[0-9]+:/ {print $2}' | sed 's/.$//');
    elif command -v ifconfig &> /dev/null; then
        interfaces=$(ifconfig | awk '/^[a-z]/ {print $1}');
    else
        echo "Не удалось получить информацию о сетевых интерфейсах (ip или ifconfig)";
    fi

    echo 'Cетевая информации' > ./files/network_info.txt;
    echo '----------------' >> ./files/network_info.txt;

    # Перебираем интерфейсы
    for interface in $interfaces; do
        # Получаем ip адрес
        ip=$(ip a show $interface | awk '/inet / {print $2}');
        # Получаем маску
        mask=$(ip a show $interface | awk '/inet / {print $2}' | cut -d/ -f2);
        # Получаем шлюз
        gateway=$(ip route show | awk '/default/ {print $3}');
        # Получаем dns
        dns=$(cat /etc/resolv.conf | awk '/nameserver/ {print $2}');
        # Получаем mac адрес
        mac=$(ip a show $interface | awk '/ether/ {print $2}');
        # Получаем mtu
        mtu=$(ip a show $interface | awk '/mtu/ {print $5}');
        # Получаем статус
        status=$(ip a show $interface | awk '/state/ {print $9}');
        # Записываем данные в файл
        echo "Интерфейс: $interface" >> ./files/network_info.txt;
        echo "IP-адрес: $ip" >> ./files/network_info.txt;
        echo "Маска: $mask" >> ./files/network_info.txt;
        echo "Шлюз: $gateway" >> ./files/network_info.txt;
        echo "DNS: $dns" >> ./files/network_info.txt;
        echo "MAC: $mac" >> ./files/network_info.txt;
        echo "MTU: $mtu" >> ./files/network_info.txt;
        echo "Статус: $status" >> ./files/network_info.txt;
        echo "----------------" >> ./files/network_info.txt;
    done
    echo "Информация о сетевых интерфейсах собрана";
};



# Сбор информации о дисках (disk_info.txt)
function get_disk_info {
    # Проверяем наличие команды lsblk
    if command -v lsblk &> /dev/null; then
        echo 'Информация о дисках' > ./files/disk_info.txt;
        echo "----------------" >> ./files/network_info.txt;
        lsblk > ./files/disk_info.txt;
    else
        echo "Не удалось получить информацию о дисках при помощи команды lsblk";
    fi
    # Проверяем наличие команды df
    if command -v df &> /dev/null; then
        echo " информация о дисковом пространстве" >> ./files/disk_info.txt;
        echo "----------------" >> ./files/network_info.txt;
        df >> ./files/disk_info.txt;
    else
        echo "Не удалось получить информацию о дисках при помощи команды df";
    fi
    # Типы файловых систем и их монтирование
    # Проверяем наличие команды mount
    if command -v mount &> /dev/null; then
        echo "Точки монтирования:" >> ./files/disk_info.txt;
        echo "----------------" >> ./files/network_info.txt;
        mount >> ./files/disk_info.txt;
    else
        echo "Не удалось получить информацию о дисках при помощи команды mount";
    fi
    echo "Информация о дисках собрана";
};



# Сбор информации о сокетах (socket_info.txt)
function get_socket_info {
    # Проверяем наличие команды ss
    if command -v ss &> /dev/null; then
        ss -a > ./files/socket_info.txt;
    else
        echo "Не удалось получить информацию о сокетах при помощи команды ss";
    fi
    echo "Информация о сокетах собрана";
};



# Сбор информации о беспроводной сети (etwork_info.txt)
function get_wireless_info {
    # Проверяем наличие команды iwconfig
    if command -v iwconfig &> /dev/null; then
        iwconfig > ./files/wireless_info.txt;
    elif command -v iw &> /dev/null; then
        iw dev > ./files/wireless_info.txt;
    else
        echo "Не удалось получить информацию о беспроводной сети при помощи команды iwconfig или iw";
    fi
    echo "Информация о беспроводной сети собрана";
};


# Копирование файлов из папки /etc в папку files/etc, /var/log в папку files/logs
function coppy_files {
    # Проверяем наличие команды cp
    if command -v cp &> /dev/null; then
        cp -RL /etc ./files/etc;
        cp -RL /var/log ./files/logs;
    else
        echo "Не удалось скопировать файлы при помощи команды cp";
    fi
    echo "Файлы скопированы";
};




function main {
    echo "Скрипт начал работу. После передачи информации, удалите собранные файлы"
    create_folders;
    get_network_info;
    get_disk_info;
    get_socket_info;
    get_wireless_info;
    get_users_info;
    get_iptables_info;
    get_packages_info;
    get_services_info;
    get_up_last_time;
    get_system_info;
    coppy_files;
    sudo chmod -R 777 ./files/*
    echo "Скрипт закончил работу. После передачи информации, удалите собранные файлы"
};

main;
