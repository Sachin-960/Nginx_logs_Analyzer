### 📄 `README.md`

```markdown
# 🔍 NGINX Log Analyzer Script

This Bash script analyzes NGINX log files and extracts key insights such as:

- Top 5 IP addresses with the most requests
- Top 5 most requested paths
- Top 5 HTTP response status codes
- Top 5 User Agents

---

## 📁 File: `analyze_nginx_log.sh`

### 📌 Prerequisites
- The log file should follow the NGINX combined log format.
- Bash shell environment.

---

## ▶️ Usage

```bash
./analyze_nginx_log.sh /path/to/nginx/access.log
```

> ⚠️ Ensure the script has execute permissions:
```bash
chmod +x analyze_nginx_log.sh
```

---

## ✅ Example Output

```
==============================
🔍 Top 5 IPs with most requests
==============================
45.76.135.253 - 1000 requests
142.93.143.8 - 600 requests
198.51.100.23 - 532 requests
203.0.113.77 - 498 requests
192.0.2.10 - 450 requests

==============================
📂 Top 5 Most Requested Paths
==============================
/index.html - 842 requests
/login - 653 requests
/products - 529 requests
/css/style.css - 421 requests
/js/app.js - 377 requests

==============================
📊 Top 5 Response Status Codes
==============================
200 - 1235 requests
404 - 423 requests
301 - 210 requests
500 - 89 requests
403 - 65 requests

==============================
🧭 Top 5 User Agents
==============================
Mozilla/5.0 - 843 requests
curl/7.68.0 - 623 requests
PostmanRuntime/7.26.8 - 412 requests
Googlebot/2.1 - 231 requests
Bingbot/2.0 - 189 requests
```

---

## 🧠 How It Works

- **IP Analysis**: Extracts the first field using `awk '{print $1}'`, which is the client IP.
- **Paths**: Extracts the second word within the quoted request string using `awk -F\" '{print $2}' | awk '{print $2}'`.
- **Status Codes**: Captures the 9th field with `awk '{print $9}'`.
- **User Agents**: Extracts the 6th field within quotes using `awk -F\" '{print $6}'`.

Each section then:
- Sorts values.
- Counts unique occurrences.
- Displays the top 5 with appropriate formatting (`request` or `requests`).

---

## 🔐 License

Feel free to modify and use it for personal or educational purposes.

