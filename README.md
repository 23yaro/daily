# daily

daily — это Flutter приложение TODO-лист

[Скачать APK](https://github.com/23yaro/daily/releases/download/latest/app-release.apk)

## Фичи

- Реализована поддержка полноценного offline режима.
- Навигация переписанна на navigator 2.0 (go_router).
- Реализованна поддержка диплинка, открывающего экран добавления задачи, даже если приложение убито.
```
  adb shell 'am start -a android.intent.action.VIEW \
  -c android.intent.category.BROWSABLE \
  -d "daily://daily.app/task_screen"' \
  app.daily
```
- Интеграция get it.
- Написаны Unit тесты для repository, local source, notifier.
- Написан интеграционный тест добавления новой задачи
- Для отладки и тестирования необходимо добавить additional run args
```
--dart-define=TOKEN=<token> --dart-define=BASEURL=https://beta.mrdekk.ru/todo --dart-define=HOST=beta.mrdekk.ru
```

## Скриншоты
<table>
    <tr>
        <td>
            Главный экран
        </td>
        <td>
            Экран редактирования
        </td>
    </tr>
    <tr>
        <td>
            <img src="/pic/main_en.jpg">
        </td>
        <td>
            <img src="/pic/edit_en.jpg">
        </td>
    </tr>
</table>