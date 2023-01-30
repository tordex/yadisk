��          �                 �        �     �  �   �  3   �  J   �  f  0  �   �  �   �  �   :  I   �  *     q   9    �  �  �  �  �
  #   D  X   h  �   �  9   �  |   �  �  F  �  �  2  �  �     y   �  t   `  y   �  �  O   If you experience low upload speeds on Windows, the reason might be due to Python's standard library internally using :code:`select()` to wait for sockets. There are several ways around it: Known Issues Low Upload Speed on Windows Monkey-patching `http.client`_ and `urllib3`_ to use bigger :code:`blocksize`. See `this comment <https://github.com/urllib3/urllib3/issues/1394#issuecomment-954044006>`_ for more details. Monkey-patching through a library like `eventlet`_. The following information may become outdated at some point in the future. The only known workaround is to upload files with changed filename extensions (or without them entirely). For example, if you want to upload a file named "my_database.db", you can initially upload it under the name "my_database.some_other_extension" and then rename it back to "my_database.db". This approach has some obvious downsides but at least it works. The reason why this problem cannot be observed when uploading through the official website, is that this throttling does not apply to internal services (the Yandex.Disk website uses an intermediate internal API to obtain upload links). This behavior of throttling is predetermined at the moment of requesting an upload link (with :any:`yadisk.YaDisk.get_upload_link`). The content of the uploaded file does not matter. Uploading files to direct links (obtained through :any:`yadisk.YaDisk.get_upload_link()`) using a different library (such as `aiohttp`_). Using `yadisk-async`_ instead. It uses `aiohttp`_ instead of `requests`_. Very Slow Upload of Certain Types of Files While it is not clear what the purpose of this throttling is, it is certain at this point that this is not a bug. Yandex.Disk's REST API limits upload speeds up to 128 KiB/s for certain MIME types of files. More specifically, throttling takes place based on value of :code:`media_type` (see :any:`yadisk.YaDisk.get_meta`). It appears there are 3 types of media types that are throttled: Project-Id-Version: YaDisk 1.2.19
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2023-01-30 18:29+0500
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: ru
Language-Team: ru <LL@li.org>
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.11.0
 Если вы столкнулись с низкой скоростью загрузки файлов на Диск под Windows, то причиной может стандартная библиотека Python, которая внутри использует :code:`select()` для ожидания сокетов. В таком случае существует несколько путей обхода данной проблемы: Известные проблемы Низкая скорость загрузки файлов на Диск под Windows Monkey-patch `http.client`_ и `urllib3`_, чтобы увеличить :code:`blocksize`. См. `этот комментарий <https://github.com/urllib3/urllib3/issues/1394#issuecomment-954044006>`_. Monkey-patch через библиотеку `eventlet`_. Данная информация может в дальнейшем будущем оказаться устаревшей. Единственный известный способ обхода данной проблемы - это загрузка файлов с измененным расширением (или без расширения). Например, если вы хотите загрузить на Диск файл "my_database.db", вы можете изначально загрузить его под именем "my_database.some_other_extension" и после загрузки переименовать обратно в "my_database.db". У такого подхода есть очевидные недостатки, но по крайней мере он работает. Причина, по которой эта проблема не наблюдается при попытке загрузить файл через оффициальный сайт, заключается в том, что ограничение скорости не применяется для внутренних сервисов (сайт Яндекс.Диска использует промежуточный внутренний API для получения ссылок). Ограничение скорости предопределяется в момент получения ссылки для загрузки файла на диск (см. :any:`yadisk.YaDisk.get_upload_link`). Содержимое загружаемого файла не имеет значения. Загрузка файлов по прямым ссылкам (полученным через :any:`yadisk.YaDisk.get_upload_link()`), используя другую библиотеку (например, `aiohttp`_). Использование `yadisk-async`_. Эта версия использует `aiohttp`_ вместо `requests`_. Очень медленная загрузка некоторых типов файлов на Яндекс.Диск Хотя и не понятно, в чем смысл такого ограничения, это точно не баг. REST API Яндекс.Диск ограничивает скорость загрузки файлов на Диск до 128 KiB/s для определенных MIME типов файлов. Если быть точнее, троттлинг осуществляется в зависимости от значения :code:`media_type` (см. :any:`yadisk.YaDisk.get_meta`). Судя по всему ограничение скорости действует на 3 типа файлов (media type): 