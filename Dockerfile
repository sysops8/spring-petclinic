# Используем JRE образ с выставленным портом
FROM eclipse-temurin:11-jre-alpine

# Создаем пользователя для безопасности (опционально, но рекомендуется)
RUN addgroup -S spring && adduser -S spring -G spring

# Переключаемся на пользователя spring
USER spring

# Выставляем порт
EXPOSE 8080

# Копируем WAR файл
COPY target/*.war app.war

# Запускаем приложение
ENTRYPOINT ["java", "-jar", "/app.war"]