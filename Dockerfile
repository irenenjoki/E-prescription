# Use an official PHP image with Apache
FROM php:8.2-apache

# Install required PHP extensions (mysqli for MySQL support)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite (important for clean URLs if needed)
RUN a2enmod rewrite

# Copy your project files into the container
COPY . /var/www/html/

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
