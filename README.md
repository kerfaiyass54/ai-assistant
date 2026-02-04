# 🤖 AI Assistant - Your Personal Knowledge-Powered Chatbot

![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)
![Python Version](https://img.shields.io/badge/python-3.11-blue.svg)
![Docker Image](https://img.shields.io/badge/docker-available-blue.svg)
![Stars](https://img.shields.io/github/stars/kerfaiyass54/ai-assistant?style=flat&label=Stars)

**A real-time AI assistant that combines cutting-edge language models with web search capabilities to provide accurate, context-aware answers.**

---

## ✨ Features

✅ **Real-time Web Search Integration** - Answers questions using live DuckDuckGo search results
✅ **Local LLM Support** - Uses Ollama's lightweight models for fast responses
✅ **RAG (Retrieval-Augmented Generation)** - Provides accurate answers grounded in current information
✅ **Simple CLI Interface** - Easy to use without any technical setup
✅ **Docker-ready** - Deploy anywhere with a single command
✅ **Extensible Architecture** - Easy to add new tools and capabilities

---

## 🛠️ Tech Stack

**Core:**
- Python 3.11
- LangChain (for AI workflows)
- Ollama (local LLM integration)
- DuckDuckGo Search API

**Infrastructure:**
- Docker (for containerized deployment)
- Python virtual environment (for local development)

**System Requirements:**
- Docker (for containerized version)
- Python 3.11+ (for local development)
- Ollama server running (for local LLM)
- ~500MB free disk space

---

## 📦 Installation

### Prerequisites

1. **For Docker Deployment:**
   - Docker installed ([Installation Guide](https://docs.docker.com/get-docker/))
   - Ollama server running on `http://host.docker.internal:11434` (default)

2. **For Local Development:**
   - Python 3.11+
   - pip package manager
   - Ollama server running

---

### Quick Start with Docker (Recommended)

```bash
# 1. Clone this repository
git clone https://github.com/kerfaiyass54/ai-assistant.git
cd ai-assistant

# 2. Start Ollama server (if not already running)
#   - Follow Ollama's installation: https://ollama.ai/

# 3. Build and run the container
docker build -t ai-assistant .
docker run -p 1234:1234 ai-assistant
```

### Quick Start with Python (Local)

```bash
# 1. Clone this repository
git clone https://github.com/kerfaiyass54/ai-assistant.git
cd ai-assistant

# 2. Create and activate virtual environment
python -m venv venv
source venv/bin/activate  # On Windows use: venv\Scripts\activate

# 3. Install dependencies
pip install -r requirements.txt

# 4. Run the assistant
python assistant.py
```

---

## 🎯 Usage

### Basic Interaction

```bash
# After starting the assistant, simply type your questions:
You: What's the capital of France?
🤖 Thinking...
🤖: The capital of France is Paris. This information is based on current search results.
```

### Environment Variables

Configure the assistant using these environment variables:

```bash
# Set Ollama server URL (default: http://host.docker.internal:11434)
export OLLAMA_BASE_URL="http://your-ollama-server:11434"

# Set maximum context length
export MAX_CONTEXT_LENGTH=1000
```


## 🔧 Configuration Options

### Custom Models

To use a different Ollama model:

```python
# Change in assistant.py
llm = Ollama(model="mistral")  # Available models: llama3, mistral, etc.
```

### Search Engine Configuration

Modify the search tool in `assistant.py`:

```python
# Change search provider
search = WikipediaQueryRun()  # Instead of DuckDuckGoSearchRun
```

### Response Formatting

Customize the response format by modifying the prompt template:

```python
prompt = ChatPromptTemplate.from_template("""
    Answer the question using ONLY the provided context.
    If the context doesn't contain the answer, say "I couldn't find that information."

    Context: {context}
    Question: {question}

    Answer in a clear, concise format with:
    1. The main answer
    2. Any relevant supporting details
    3. Sources if available
""")
```

---

## 🤝 Contributing

We welcome contributions of all kinds! Here's how you can help:

### Development Setup

1. Fork the repository
2. Clone your fork locally
3. Set up a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate
   ```
4. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

### Code Style Guidelines

- Follow PEP 8 style guide
- Write clear, concise comments
- Include type hints where appropriate
- Keep functions under 50 lines when possible

### Pull Request Process

1. Create a new branch for your feature/bugfix
2. Make your changes
3. Add tests if applicable
4. Update documentation
5. Submit a pull request with a clear description


## 🐛 Issues & Support

### Reporting Issues

Found a bug or have a feature request? Please:

1. Search existing issues first
2. Create a new issue with:
   - Clear description of the problem
   - Steps to reproduce
   - Expected vs actual behavior
   - Any relevant error messages
   - Your environment (Python version, Ollama version, etc.)

### Getting Help

- Open an issue on this repository
- Join our [Discord community](https://discord.gg/yourcommunity)
- Ask questions on [Stack Overflow](https://stackoverflow.com) with `ai-assistant` tag

### FAQ

**Q: Why use Ollama instead of other LLMs?**
A: Ollama provides lightweight, locally-run models that are perfect for quick deployment without cloud dependencies.

**Q: Can I use this with other search engines?**
A: Yes! The code is designed to be easily extensible. See the "Advanced Configuration" section.

**Q: How do I deploy this to production?**
A: We recommend using Docker with a reverse proxy (Nginx, Traefik) for better performance and security.

