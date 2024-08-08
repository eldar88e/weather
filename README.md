# Weather API

Этот проект представляет собой API погоды, построенное на Ruby on Rails. Он предоставляет данные о текущей погоде и другие метеорологические данные.

## Технологии

- **Ruby**: 3.2.2
- **Rails**: 7.1.3
- **PostgreSQL**: база данных
- **Puma**: веб-сервер
- **Good Job**: для обработки фоновых задач

## Установка

1. **Клонируйте репозиторий:**

   ```bash
   git clone git@github.com:eldar88e/weather.git
   cd weather
    ```
2. **Установка зависимостей и запуск:**

   Если вы используете Docker, установка зависимостей и запуск осуществляется с помощью одной команды:
   ```bash
   docker-compose up --build
   ```
   
   Или без Docker:
    ```bash
    bundle
    
    rails db:prepare
    
    rails s
   ```

## Тестирование

Для запуска тестов используйте Docker:
```bash
docker-compose -f docker-compose-test.yml up --build --abort-on-container-exit
```

Или без Docker:
```bash
bundle exec rspec
```