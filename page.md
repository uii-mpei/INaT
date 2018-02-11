---
title: Информационные сети и телекоммуникации (ИСиТ)
lang: ru-RU

---

<link rel="stylesheet" type="text/css" href="/study/courses/assets/styles/style.css">

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
2. Протоколы канального уровня (Ethernet, VLAN, ARP)
3. Протоколы сетевого уровня (IPv4, ICMP, IPv6 обзорно)
4. Обнаружение узлов и маршрутизация (DHCP, DNS, маршрутизация)
5. Надежная передача данных (TCP)
6. Принципы и протоколы прикладного уровня (HTTP, серверы, RPC)
7. Преобразование адресов (NAT). Туннелирование (VPN)
8. Принципы защищенной и доверенной связи (криптография, TLS)


## Лабораторные работы

[Регламент](rules.html), в том числе правила оформления отчетов.

### 1. [Средства диагностики сетей](lab01-tools.html)

- [Wireshark](https://www.wireshark.org/#download) —
    анализатор сетевого трафика.


### 2. [Приемы программирования сетевых приложений](lab02-api.html)

Повторение C++ (работа с памятью).  Сборка приложений, использующий API сокетов.

- [MinGW][mingw] — компилятор GCC 7.2 для Windows.
- [CodeBlocks](http://www.codeblocks.org/downloads/26) — легковесная IDE.

[mingw]: https://sf.net/p/mingw-w64/files/Toolchains%20targetting%20Win32/Personal%20Builds/mingw-builds/installer/mingw-w64-install.exe/download


### 3. Блокирующие UDP-сокеты

Простейший обмен короткими сообщениями по сети.

- [Nmap](https://nmap.org/) —
    набор программ для исследования и диагностики сети.
    Для Linux можно использовать `netcat` (BSD) и `nmap`.

Далее: TCP, двоичные протоколы, HTTP, криптография.


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
    «[ВКонтакте](https://vk.com/plushbeaver)», [почта][email]

[email]: http://www.google.com/recaptcha/mailhide/d?k=01_uWea10RK7AzO-a9C2nBjg==&c=nG5zSR4276ZYxX7ItHJb_A_Lzdt787hUjxLUG5R7rwY=
