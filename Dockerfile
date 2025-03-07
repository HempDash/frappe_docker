# Use the official ERPNext image as the base image
FROM frappe/erpnext:v15.54.1

# -----------------------------------------------------------------------------
# Set default environment variables.
# These can be overridden by Railway environment variables.
# -----------------------------------------------------------------------------
ENV FRAPPE_SITE_NAME_HEADER=erp.gethempdash.com \
    DB_HOST=mysql.railway.internal \
    DB_PORT=3306 \
    DB_PASSWORD=JUEtofmcKDlWPhuJNKkcjYgqTgyNUWjN \
    ADMIN_PASSWORD=88f1ea9034e0650c06c33e364face019 \
    REDIS_CACHE=redis://redis.railway.internal:6379 \
    REDIS_QUEUE=redis://redis.railway.internal:6379 \
    REDIS_SOCKETIO=redis://redis.railway.internal:6379 \
    LETSENCRYPT_EMAIL=mail@gethempdash.com \
    HTTP_PUBLISH_PORT=8080 \
    UPSTREAM_REAL_IP_ADDRESS=127.0.0.1 \
    UPSTREAM_REAL_IP_HEADER=X-Forwarded-For \
    UPSTREAM_REAL_IP_RECURSIVE=off \
    PROXY_READ_TIMEOUT=120s \
    CLIENT_MAX_BODY_SIZE=50m \
    SITES=`erp.gethempdash.com`

# Expose the default ERPNext port (Gunicorn typically listens on 8000)
EXPOSE 8000

# Start ERPNext using bench. The official image is set up to manage multiple processes.
CMD ["bench", "start"]
