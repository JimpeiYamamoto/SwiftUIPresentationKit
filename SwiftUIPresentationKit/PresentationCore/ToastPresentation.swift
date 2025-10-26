import SwiftUI
import Combine

// MARK: - ToastManager
@Observable
final class ToastManager {
    var message: String = ""
    var isVisible: Bool = false

    func show(_ message: String) {
        self.message = message
        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
            isVisible = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.hide()
        }
    }

    func hide() {
        withAnimation(.easeInOut(duration: 0.4)) {
            isVisible = false
        }
    }
}

struct ToastView: View {
    let message: String
    let onDismiss: () -> Void

    @State private var offsetY: CGFloat = 150

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(message)
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .medium))
                    .lineLimit(2)
                    .padding(.leading, 12)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding(10)
                }
            }
            .padding(.vertical, 12)
            .background(Color.black.opacity(0.9))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal, 16)
            .offset(y: offsetY)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if value.translation.height > 0 {
                            offsetY = value.translation.height
                        }
                    }
                    .onEnded { value in
                        if value.translation.height > 50 {
                            dismiss()
                        } else {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                offsetY = 0
                            }
                        }
                    }
            )
            .onAppear {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                    offsetY = 0
                }
            }
        }
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }

    private func dismiss() {
        withAnimation(.easeInOut(duration: 0.3)) {
            offsetY = 150
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            onDismiss()
        }
    }
}

// MARK: - View Modifier
struct ToastModifier: ViewModifier {
    var manager: ToastManager

    func body(content: Content) -> some View {
        ZStack {
            content
            if manager.isVisible {
                ToastView(message: manager.message) {
                    manager.hide()
                }
                .zIndex(1)
            }
        }
    }
}

extension View {
    /// 任意のViewにトーストを付与
    func toast(manager: ToastManager) -> some View {
        self.modifier(ToastModifier(manager: manager))
    }
}

// MARK: - Example
struct ToastExampleView: View {
    @State private var toastManager = ToastManager()

    var body: some View {
        VStack(spacing: 20) {
            Button("成功メッセージを表示") {
                toastManager.show("操作が完了しました")
            }
            Button("エラーメッセージを表示") {
                toastManager.show("通信エラーが発生しました")
            }
        }
        .toast(manager: toastManager)
    }
}

#Preview {
    ToastExampleView()
}
