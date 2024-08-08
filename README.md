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
Установите зависимости:
 ```

2. **Если вы используете Docker, установите зависимости с помощью Docker:**
   
Если вы используете Docker, установите зависимости с помощью Docker:
```bash
docker-compose up --build
```
   
Или без Docker:
 ```bash
 bundle install
```
   
3. **Настройте базу данных:**
 ```bash
 rails db:prepare
 ```

4. **Запустите сервер:**

Если вы используете Docker:
```bash
docker-compose up
```
Или без Docker:
```bash
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