using UnityEngine;
using Klak.Spout;

namespace Beta
{
    public class KodeOverlay : MonoBehaviour
    {
        #region Editable properties

        [SerializeField] SpoutReceiver _receiver;

        [SerializeField] Color _textColor = Color.green;

        public Color textColor {
            get { return _textColor; }
            set { _textColor = value; }
        }

        [SerializeField, Range(0, 1)] float _noiseAmplitude = 0.1f;

        public float noiseAmplitude {
            get { return _noiseAmplitude; }
            set { _noiseAmplitude = value; }
        }

        #endregion

        #region Private fields

        [SerializeField, HideInInspector] Shader _shader;

        Material _material;

        #endregion

        #region MonoBehaviour functions

        void Start()
        {
            _material = new Material(_shader);
        }

        void OnRenderImage(RenderTexture source, RenderTexture destination)
        {
            _material.SetColor("_Color", _textColor);
            _material.SetFloat("_Noise", _noiseAmplitude * 0.25f);
            _material.SetTexture("_KodeTex", _receiver.receivedTexture);
            Graphics.Blit(source, destination, _material, 0);
        }

        #endregion
    }
}
