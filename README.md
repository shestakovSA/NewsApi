# Актуальная новостная лента (API: newsapi.org)

## Обзор

Приложение отображает список актуальный новостных каналов (All News), есть возможность добавить канал в избранное (Favorites) и удалить из списка избранных, при натажие на кнопку "Show News", отображаются новости избранных каналов с изображениями. Есть возможность поиска новостей по ключевым словам (Search). Если приложение открыто без доступа к сети, новости можно посмотреть в оффлайн режиме.

### Список всех каналов, избранные каналы
![alt tag](https://github.com/shestakovSA/screen/blob/master/RPReplay_Final1598345108%202.gif "Главный экран и экран избранных каналов")​
### Поиска ключевых слов по всем новостям
![alt tag](https://github.com/shestakovSA/screen/blob/master/RPReplay_Final1598345108%203.gif "Экран поиска")​
### Новости без доступа к сети
![alt tag](https://github.com/shestakovSA/screen/blob/master/RPReplay_Final1598346325.gif "Оффлайн режим")​

## ТЗ
Make an application for viewing news channels from https://newsapi.org using its API.
### General Requirements:
1. The application must be user friendly and display notifications and
errors.
2. Supported operating systems are iOS 11 and higher.
3. Supported mobile devices are iPhones.
### Requirements:
The application should contain TabBar menu with screens listed:
#### All Channels list screen:
1. The channel cell must contain the channel’s name and description;
2. The cell must have an option to add channel to Favorites.
#### Favorite Сhannels list screen:
1. This list must have an option to remove a channel from the it;
2. The right top corner must have a Show News button that displays a list
of all the news from the favorite channels;
3. The news cell should contain a picture of the news in the background,
the news title and description. News description must be 2 lines max.
4. Add offline cache for news: after restarting the app, a user should be
able to see previously downloaded news.
The UX example:
#### Search screen:
1. The search screen should be able to find all the news contains the
search words.

### General Notes:
1. Keep your code clean;
2. Prefer quality to the speed of delivering the task;
3. The code should be covered with the tests;
4. UI can be pretty simple but user friendly;
5. The source code of application should be uploaded on github.com.



## Комментарии
1. На бесплатной подписке NewsApi нет возможности получать данные по нескольким каналам одним запросом, максимально 20 результатов. Поэтому пришлось обращаться к серверу по каждому каналу отдельно. По этой же причине description приходит не полный.

## Планы по доработке

1. Кэширование изображений
2. Архитектура
3. Экран выбора языка, страны
4. Фильтры (топ, дата)
5. Устранить утечки памяти
6. Доработать интерфейс
