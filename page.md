---
title: Информационные сети и телекоммуникации (ИСиТ)
lang: ru-RU

---

В курс входит:

- стек протоколов TCP/IP и сопутствующих;
- программирование на уровне API сокетов;
- NAT, туннели, TLS (криптография) на базовом уровне.

В курс *не* входит построение и настройка сетей, маршрутизация (только обзорно).

В конце — экзамен с оценкой в диплом; ЛР влияют на эту оценку.
Версии прошлых лет: [2015](15), [2016](16).


# График

## Лекции

1. Модель сетевого взаимодействия (базовые понятия, OSI)
2. [Протоколы канального уровня (Ethernet, VLAN, ARP)](lecture/02-layer2)
3. Протоколы сетевого уровня (IPv4, ICMP, IPv6 обзорно)
4. Обнаружение узлов и маршрутизация (DHCP, DNS, маршрутизация)
5. Надежная передача данных (TCP). Преобразование адресов (NAT).
6. ~~Принципы и протоколы прикладного уровня (HTTP, серверы, RPC)~~
7. Принципы и технологии защищенной и доверенной связи
    (криптография, TLS, туннели, VPN)


## Лабораторные работы

[Регламент](rules.html), в том числе правила оформления отчетов.

### 1. (08.02) [Средства диагностики сетей](lab01-tools.html)

- [Wireshark](https://www.wireshark.org/#download) —
    анализатор сетевого трафика.


### 2. (16.02) [Приемы программирования сетевых приложений](lab02-api.html)

Повторение C++ (работа с памятью).  Сборка приложений, использующих API сокетов.

- MinGW ([32 бита][gcc32], [64 бита][gcc64]) — компилятор GCC 7.2 для Windows.
- [CodeBlocks](http://www.codeblocks.org/downloads/26) — легковесная IDE.

[gcc32]: https://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win32/Personal%20Builds/mingw-builds/7.2.0/threads-posix/sjlj/i686-7.2.0-release-posix-sjlj-rt_v5-rev1.7z
[gcc64]: https://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win64/Personal%20Builds/mingw-builds/7.2.0/threads-posix/sjlj/x86_64-7.2.0-release-posix-sjlj-rt_v5-rev1.7z


###   (02.03) Занятие для защит


### 3. (16.03) [Блокирующие UDP-сокеты](lab/03-udp)

Простейший обмен короткими сообщениями по сети.

- [Nmap](https://nmap.org/) —
    набор программ для исследования и диагностики сети.
    Для ЛР нужна `netcat` (`ncat`) — универсальный клиент и сервер TCP и UDP.


### 4. (23.03) [Блокирующие TCP-сокеты.  Клиент для передачи файлов](lab/04-tcp-client)


### 5. (30.03) [Блокирующие TCP-сокеты.  Сервер для передачи файлов](lab/05-tcp-server)


###   (06.04) Занятие для защит


### 6. (13.04) [Асинхронное взаимодействие на базе потоков](lab/06-threaded-server)


###   (20.04) Занятие для защит


### 7. (23.04) [Неблокирующий режим работы сокетов](lab/07-nonblocking-server)

<div class="alert">
* 15.05 внесены небольшие, но важные исправления.
</div>

###   (04.05) Продолжение ЛР № 7

###   (11.05) Продолжение ЛР № 7

### 8. (18.05) Технологии защищенных каналов связи

###   (25.05) Занятие для защит и проставления зачетов


# Литература

- **В. Г. Олифер, Н. А. Олифер. Компьютерные сети. Принципы, технологии,
    протоколы. — 5-е изд.— СПб.: Питер, 2016. — 992 с.
    ([УДК 621.398 О-546][ntb])**
- Richard Stevens. TCP/IP Illustrated, Volume 1: The Protocols (2nd Edition).
- [The TCP/IP Guide](http://www.tcpipguide.com) —
    бесплатно доступная книга об устройстве сетей и протоколов интернета.
- [Beej´s Guide to Network Programming](http://beej.us/guide/bgnet)
    ([перевод](http://masandilov.ru/network/guide_to_network_programming)) —
    руководство по программированию сетевых приложений. Включает
    справку по функциям API сокетов с комментариями и примерами.
- [Материалы для подготовки к CCNA](http://ccna.mpei.ac.ru) —
    «младшей» ступени сертификации администраторов устройств Cisco.
    Содержит много иллюстраций к теоретической части ИСиТ.

[ntb]: https://opac.mpei.ru/index.php?url=/notices/index/211074/default


# Связь

* Дмитрий Козлюк, лектор и лаборант А-01-14:
    «[ВКонтакте](https://vk.com/plushbeaver)», [почта][email/dk].

* Борис Вишняков, лаборант А-02-14:
    «[ВКонтакте](https://vk.com/zvinnyz)», [почта][email/bv].

[email/dk]: http://www.google.com/recaptcha/mailhide/d?k=01_uWea10RK7AzO-a9C2nBjg==&c=nG5zSR4276ZYxX7ItHJb_A_Lzdt787hUjxLUG5R7rwY=
[email/bv]: http://www.google.com/recaptcha/mailhide/d?k=01KLcfsSrFyXTv3zRsddFxew==&c=vtxI02xSbsmb6by9yirdMgL0fHIyAtLrG6-zn9Xmwv0=
