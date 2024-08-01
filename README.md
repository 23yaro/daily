# daily

daily — это Flutter приложение TODO-лист

[Скачать APK](https://github.com/23yaro/daily/releases/download/latest/app-release.apk)

## Фичи

- Поддержка разных размеров и landscape ориентации экрана
- Поддержка темной темы
- Реализована работа с Remote Configs
- К проекту подключён и настроен Firebase Crashlytics
- Поддержаны 2 флейвора с помощью dart define, визуально отличаются шильдиком DEV
- Настроен CI на GitHub (форматирование, линтер, тесты, сборка), распространение через Firebase App
  Distribution
- Добавлен Firebase analytics
- Дата модели теперь freezed
- Для отладки и тестирования необходимо добавить additional run args

```
--dart-define=APP_VERSION=DEV
--dart-define=TOKEN=<ваш токен>
--dart-define=BASEURL=https://beta.mrdekk.ru/todo
--dart-define=HOST=beta.mrdekk.ru
```

## Скриншоты

<table>
    <tr>
        <td>
            Firebase App Distribution
        </td>
        <td>
            Темная тема
        </td>
        <td>
            Лендскейп ориентация мейн страница
        </td>
        <td>
            Лендскейп ориентация таск страница
        </td>
        <td>
            Лендскейп ориентация таск страница
        </td>
    </tr>
    <tr>
        <td>
            <img src="/pic/firebase_app_distribution.jpg">
        </td>
        <td>
            <img src="/pic/dmain.jpg">
        </td>
        <td>
            <img src="/pic/lmain.jpg">
        </td>
        <td>
            <img src="/pic/ledit1.jpg">
        </td>
        <td>
            <img src="/pic/ledit2.jpg">
        </td>
    </tr>
</table>