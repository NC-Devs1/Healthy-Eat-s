//
//  AIAssistantView.swift
//  HealthyEats
//
//  Created for Healthy Eat's
//

import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let content: String
    let isUser: Bool
    let timestamp: Date
}

struct AIAssistantView: View {
    @State private var messageText = ""
    @State private var messages: [Message] = [
        Message(content: "Hello! I'm your AI Health Assistant. I can help you with nutrition advice, meal suggestions, exercise tips, and answer your health-related questions. How can I assist you today?", isUser: false, timestamp: Date())
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(messages) { message in
                                MessageBubble(message: message)
                                    .id(message.id)
                            }
                        }
                        .padding()
                    }
                    .onChange(of: messages.count) { _, _ in
                        if let lastMessage = messages.last {
                            withAnimation {
                                proxy.scrollTo(lastMessage.id, anchor: .bottom)
                            }
                        }
                    }
                }
                
                Divider()
                
                HStack(spacing: 12) {
                    TextField("Ask me about health...", text: $messageText, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(1...5)
                    
                    Button(action: sendMessage) {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.title)
                            .foregroundColor(messageText.isEmpty ? .gray : .green)
                    }
                    .disabled(messageText.isEmpty)
                }
                .padding()
                .background(Color(.systemBackground))
            }
            .navigationTitle("AI Assistant")
        }
    }
    
    func sendMessage() {
        guard !messageText.isEmpty else { return }
        
        let userMessage = Message(content: messageText, isUser: true, timestamp: Date())
        messages.append(userMessage)
        
        let query = messageText.lowercased()
        messageText = ""
        
        // Simulate AI response
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let response = generateResponse(for: query)
            let aiMessage = Message(content: response, isUser: false, timestamp: Date())
            messages.append(aiMessage)
        }
    }
    
    func generateResponse(for query: String) -> String {
        // Simple response logic - in a real app, this would connect to an AI service
        if query.contains("calorie") || query.contains("calories") {
            return "For calorie management, I recommend tracking your daily intake using our Health Tracker. The average adult needs 2000-2500 calories per day, but this varies based on activity level, age, and goals. Would you like tips on healthy low-calorie meals?"
        } else if query.contains("protein") {
            return "Protein is essential for muscle building and repair. Good sources include lean meats, fish, eggs, legumes, and Greek yogurt. Aim for 0.8-1g of protein per pound of body weight if you're active. Check our Products section for high-protein recommendations!"
        } else if query.contains("weight") || query.contains("lose") {
            return "Healthy weight management combines balanced nutrition with regular exercise. Focus on whole foods, adequate protein, and a modest calorie deficit of 300-500 calories. Avoid crash diets! Would you like me to suggest a meal plan?"
        } else if query.contains("exercise") || query.contains("workout") {
            return "A balanced exercise routine includes both cardio and strength training. Aim for 150 minutes of moderate activity per week. Start with walking, swimming, or cycling, and gradually add resistance training. Check our Tips section for more exercise advice!"
        } else if query.contains("meal") || query.contains("recipe") {
            return "I'd love to help with meal ideas! For a balanced meal, fill half your plate with vegetables, a quarter with lean protein, and a quarter with whole grains. Try our Meal Planner to organize your weekly meals. Any specific dietary preferences?"
        } else {
            return "That's a great question! For personalized health advice, I recommend consulting with a healthcare professional. In the meantime, explore our app's features: use the Meal Planner for organized eating, track your health metrics, read our curated tips, and browse recommended healthy products. Is there something specific I can help you with?"
        }
    }
}

struct MessageBubble: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isUser { Spacer() }
            
            VStack(alignment: message.isUser ? .trailing : .leading, spacing: 4) {
                Text(message.content)
                    .padding(12)
                    .background(message.isUser ? Color.green : Color(.systemGray5))
                    .foregroundColor(message.isUser ? .white : .primary)
                    .cornerRadius(16)
                
                Text(message.timestamp, style: .time)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: 280, alignment: message.isUser ? .trailing : .leading)
            
            if !message.isUser { Spacer() }
        }
    }
}

#Preview {
    AIAssistantView()
}
